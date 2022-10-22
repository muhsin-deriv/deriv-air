part of 'create_trade_bloc.dart';

CreateTradeState initialState(Symbol symbol) =>
    CreateTradeState(symbol: symbol, amount: 0);

@immutable
class CreateTradeState {
  final Symbol symbol;
  final Proposal? buyProposal;
  final Proposal? sellProposal;
  final double amount;

  CreateTradeState({
    required this.symbol,
    required this.amount,
    this.buyProposal,
    this.sellProposal,
  });

  CreateTradeState copyWith({
    Symbol? symbol,
    Proposal? buyProposal,
    Proposal? sellProposal,
    double? amount,
  }) {
    return CreateTradeState(
      symbol: symbol ?? this.symbol,
      buyProposal: buyProposal ?? this.buyProposal,
      sellProposal: sellProposal ?? this.sellProposal,
      amount: amount ?? this.amount,
    );
  }

  CreateTradeState copyWithProposal({
    Proposal? buyProposal,
    Proposal? sellProposal,
  }) {
    return CreateTradeState(
      symbol: this.symbol,
      buyProposal: buyProposal,
      sellProposal: sellProposal,
      amount: this.amount,
    );
  }
}
