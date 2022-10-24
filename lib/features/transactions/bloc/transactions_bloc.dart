import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:meta/meta.dart';
import 'package:price_tracker/common/exceptions/api_exceptions.dart';
import 'package:price_tracker/common/models/open_contract_model.dart';
import 'package:price_tracker/common/models/portfolio_model.dart';
import 'package:price_tracker/common/repository/api_connection.dart';
import 'package:price_tracker/common/repository/transactions_repo.dart';

import '../../../common/models/profit_table_item.dart';
import '../../../common/models/transaction_model.dart';

part 'transactions_event.dart';
part 'transactions_state.dart';

class TransactionsBloc extends Bloc<TransactionsEvent, TransactionsState> {
  final TransactionsRepo transactionsRepo = TransactionsRepo();
  StreamSubscription? transactionSubscription;
  String transactionSubscriptionId = '';
  StreamSubscription? contractSubscription;
  String contractSubscriptionId = '';

  TransactionsBloc() : super(initialTransactionsState) {
    on<TransactionsEvent>((event, emit) async {
      if (event is InitializeTransactions) {
        await _initializeClosedPositions(emit);
        await _getCurrentPortFolio(emit);
        _initTransactionsStream();
        _initContractsStream();
      }

      if (event is NewTransaction) {
        await _initializeClosedPositions(emit);
        await _getCurrentPortFolio(emit);
      }

      if (event is NewContract) {
        final map = state.openContracts;
        map[event.contract.contractId] = event.contract;
        emit(state.copyWith(openContracts: map));
      }
    });
  }

  void _onEveryTransaction(Transaction transaction) {
    final action = transaction.action.toLowerCase();
    if (action != "buy" && action != "sell") {
      return;
    }

    add(NewTransaction(transaction));
  }

  void _initContractsStream() async {
    try {
      // Stop listening to subscription and send forget command
      contractSubscription?.cancel();
      if (contractSubscriptionId.isNotEmpty) {
        transactionsRepo.forgetSubscription(contractSubscriptionId);
      }

      // Create new subscription
      final response = await transactionsRepo.callAndWaitForData(
        "proposal_open_contract",
        jsonEncode({"proposal_open_contract": 1, "subscribe": 1}),
      );

      contractSubscriptionId = response['subscription']['id'];

      // Add a new event upon every Contract
      contractSubscription = transactionsRepo.contractsStream().listen(
        (OpenContract contract) {
          add(NewContract(contract));
        },
      );
    } on ApiError catch (e) {
      Fluttertoast.showToast(msg: e.message);
    }
  }

  void _initTransactionsStream() async {
    try {
      // Stop listening to subscription and send forget command
      transactionSubscription?.cancel();
      if (transactionSubscriptionId.isNotEmpty) {
        transactionsRepo.forgetSubscription(transactionSubscriptionId);
      }

      // Create new subscription
      final response = await transactionsRepo.callAndWaitForData(
        "transaction",
        jsonEncode({"transaction": 1, "subscribe": 1}),
      );
      transactionSubscriptionId = response['subscription']['id'];

      // Add a new event upon every transaction
      transactionSubscription =
          transactionsRepo.transactionStream().listen(_onEveryTransaction);
    } on ApiError catch (e) {
      Fluttertoast.showToast(msg: e.message);
    }
  }

  Future<void> _initializeClosedPositions(
    Emitter<TransactionsState> emit,
  ) async {
    try {
      final List<ProfitTableItem> closedPositions =
          await transactionsRepo.getClosedPositions();
      emit(state.copyWith(
        isLoading: false,
        closedPositions: closedPositions,
      ));
    } catch (e) {
      emit(state.copyWith(
        isLoading: false,
        hasError: true,
        error: e.toString(),
      ));
    }
  }

  Future<void> _getCurrentPortFolio(Emitter<TransactionsState> emit) async {
    try {
      final List<Portfolio> openPortfolioContracts =
          await transactionsRepo.getOpenPortfolio();
      openPortfolioContracts
          .sort((a, b) => a.expiryTime.compareTo(b.expiryTime));
      emit(
        state.copyWith(
          isLoading: false,
          openContractIds:
              openPortfolioContracts.map((e) => e.contractId).toList(),
        ),
      );
    } catch (e) {
      emit(state.copyWith(
        isLoading: false,
        hasError: true,
        error: e.toString(),
      ));
    }
  }
}
