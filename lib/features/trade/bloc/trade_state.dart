part of 'trade_bloc.dart';

final initialTradeState = TradeState(
  isLoading: true,
  hasError: false,
  symbols: [],
  filteredSymbols: [],
  markets: [],
);

@immutable
class TradeState {
  final bool isLoading;
  final bool hasError;
  final Object? error;

  final List<Symbol> symbols;
  final Market? selectedMarket;
  final List<Market> markets;
  final List<Symbol> filteredSymbols;

  TradeState({
    required this.isLoading,
    required this.hasError,
    this.error,
    required this.symbols,
    this.selectedMarket,
    required this.filteredSymbols,
    required this.markets,
  });

  TradeState copyWith({
    bool? isLoading,
    bool? hasError,
    Object? error,
    List<Symbol>? symbols,
    Market? selectedMarket,
    List<Symbol>? filteredSymbols,
    Symbol? selectedSymbol,
    List<Market>? markets,
  }) {
    return TradeState(
      isLoading: isLoading ?? this.isLoading,
      hasError: hasError ?? this.hasError,
      error: error ?? this.error,
      symbols: symbols ?? this.symbols,
      selectedMarket: selectedMarket ?? this.selectedMarket,
      filteredSymbols: filteredSymbols ?? this.filteredSymbols,
      markets: markets ?? this.markets,
    );
  }
}
