import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:price_tracker/common/repository/transactions_repo.dart';

import '../../../common/models/profit_table_item.dart';

part 'transactions_event.dart';
part 'transactions_state.dart';

class TransactionsBloc extends Bloc<TransactionsEvent, TransactionsState> {
  final TransactionsRepo transactionsRepo = TransactionsRepo();

  TransactionsBloc() : super(initialTransactionsState) {
    on<TransactionsEvent>((event, emit) async {
      if (event is InitializeTransactions) {
        await _initializeClosedPositions(emit);
      }
    });
  }

  Future<void> _initializeClosedPositions(
      Emitter<TransactionsState> emit) async {
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

  // Future<void> _initializeOpenPositions() {}
}
