part of 'trade_bloc.dart';

@immutable
abstract class TradeEvent {}

class InitializeTrade extends TradeEvent {}

class OnMarketChosen extends TradeEvent {
  final Market market;
  OnMarketChosen(this.market);
}
