part of 'trade_bloc.dart';

final initialTradeState = TradeState(
  isLoading: true,
  hasError: false,
  symbols: [],
  filteredSymbols: [],
);

@immutable
class TradeState {
  final bool isLoading;
  final bool hasError;
  final Object? error;

  final List<Symbol> symbols;
  final Market? selectedMarket;
  final List<Symbol> filteredSymbols;
  final Symbol? selectedSymbol;

  TradeState({
    required this.isLoading,
    required this.hasError,
    this.error,
    required this.symbols,
    this.selectedMarket,
    required this.filteredSymbols,
    this.selectedSymbol,
  });
}
