part of 'transactions_bloc.dart';

final initialTransactionsState = TransactionsState(
  isLoading: true,
  closedPositions: [],
  hasError: false,
  openPositions: [],
);

@immutable
class TransactionsState {
  final bool isLoading;
  final bool hasError;
  final Object? error;

  final List<ProfitTableItem> closedPositions;
  final List<dynamic> openPositions;

  TransactionsState({
    required this.isLoading,
    required this.hasError,
    this.error,
    required this.closedPositions,
    required this.openPositions,
  });

  TransactionsState copyWith({
    bool? isLoading,
    bool? hasError,
    Object? error,
    List<ProfitTableItem>? closedPositions,
    List<dynamic>? openPositions,
  }) {
    return TransactionsState(
      isLoading: isLoading ?? this.isLoading,
      hasError: hasError ?? this.hasError,
      error: error ?? this.error,
      closedPositions: closedPositions ?? this.closedPositions,
      openPositions: openPositions ?? this.openPositions,
    );
  }
}
