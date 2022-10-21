import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:price_tracker/common/models/symbol_model.dart';

part 'trade_event.dart';
part 'trade_state.dart';

class TradeBloc extends Bloc<TradeEvent, TradeState> {
  TradeBloc() : super(initialTradeState) {
    on<TradeEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
