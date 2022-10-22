import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:price_tracker/common/models/symbol_model.dart';
import 'package:price_tracker/common/repository/trade_repo.dart';

import '../../../common/models/market_model.dart';

part 'trade_event.dart';
part 'trade_state.dart';

class TradeBloc extends Bloc<TradeEvent, TradeState> {
  final TradeRepo symbolsRepo = TradeRepo();

  TradeBloc() : super(initialTradeState) {
    on<TradeEvent>((event, emit) async {
      if (event is InitializeTrade) {
        await _onInitializeTrade(emit);
      }

      if (event is OnMarketChosen) {
        await _onMarketChosen(event, emit);
      }
    });
  }
  Future<void> _onInitializeTrade(Emitter<TradeState> emit) async {
    try {
      final List<Symbol> symbols = await symbolsRepo.getSymbols();
      final markets = Set<Market>.from(symbols.map((e) => e.market)).toList();
      final selectedMarket = markets.first;
      emit(state.copyWith(
        isLoading: false,
        hasError: false,
        filteredSymbols: symbols
            .where((element) => element.market == selectedMarket)
            .toList(),
        symbols: symbols,
        markets: markets,
        selectedMarket: selectedMarket,
      ));
    } catch (e) {
      emit(state.copyWith(
        isLoading: false,
        hasError: true,
        error: e.toString(),
      ));
    }
  }

  Future<void> _onMarketChosen(
    OnMarketChosen event,
    Emitter<TradeState> emit,
  ) async {
    emit(state.copyWith(
      selectedMarket: event.market,
      filteredSymbols: state.symbols
          .where((element) => element.market == event.market)
          .toList(),
    ));
  }
}
