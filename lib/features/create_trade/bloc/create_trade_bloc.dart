import 'package:bloc/bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:meta/meta.dart';
import 'package:price_tracker/common/models/contract_type_enum.dart';
import 'package:price_tracker/common/models/proposal_model.dart';
import 'package:price_tracker/common/models/symbol_model.dart';
import 'package:price_tracker/common/repository/trade_repo.dart';
import 'package:price_tracker/main.dart';

import '../../../common/exceptions/api_exceptions.dart';

part 'create_trade_event.dart';
part 'create_trade_state.dart';

class CreateTradeBloc extends Bloc<CreateTradeEvent, CreateTradeState> {
  final Symbol symbol;
  final TradeRepo tradeRepo = TradeRepo();

  CreateTradeBloc(this.symbol) : super(initialState(symbol)) {
    on<CreateTradeEvent>((event, emit) async {
      if (event is CreateProposal) {
        await _onCreateProposal(event, emit);
      }
      if (event is BuyProposal) {
        await _onBuyProposal(event, emit);
      }
    });
  }

  Future<void> _onBuyProposal(
    BuyProposal event,
    Emitter<CreateTradeState> emit,
  ) async {
    try {
      await tradeRepo.buyProposal(event.proposal, event.amount);
      Fluttertoast.showToast(
        msg: "Buy Successful. Check Transactions for status",
      );
    } catch (e) {
      if (e is ApiError) {
        Fluttertoast.showToast(msg: e.message);
        emit(state.copyWithProposal(
          buyProposal: null,
          sellProposal: null,
        ));
      }
    } finally {
      MyApp.popCurrentPage();
    }
  }

  Future<void> _onCreateProposal(
    CreateProposal event,
    Emitter<CreateTradeState> emit,
  ) async {
    try {
      emit(state.copyWithProposal(
        buyProposal:
            event.contractType == ContractType.buy ? null : state.buyProposal,
        sellProposal:
            event.contractType == ContractType.sell ? null : state.sellProposal,
      ));
      final Proposal proposal = await tradeRepo.getProposal(
        symbol: symbol.symbol,
        contractType: event.contractType.toBackendKey(),
        amount: event.amount,
      );
      emit(state.copyWithProposal(
        buyProposal: event.contractType == ContractType.buy
            ? proposal
            : state.buyProposal,
        sellProposal: event.contractType == ContractType.sell
            ? proposal
            : state.sellProposal,
      ));
    } catch (e) {
      if (e is ApiError) {
        Fluttertoast.showToast(msg: e.message);
      }
    }
  }
}
