part of 'create_trade_bloc.dart';

@immutable
abstract class CreateTradeEvent {}

class CreateProposal extends CreateTradeEvent {
  final String symbol;
  final ContractType contractType;
  final double amount;

  CreateProposal({
    required this.symbol,
    required this.contractType,
    required this.amount,
  });
}

class BuyProposal extends CreateTradeEvent {
  final Proposal proposal;
  final double amount;

  BuyProposal({
    required this.proposal,
    required this.amount,
  });
}
