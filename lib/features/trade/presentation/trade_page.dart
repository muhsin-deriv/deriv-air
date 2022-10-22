import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:price_tracker/features/trade/bloc/trade_bloc.dart';
import 'package:price_tracker/features/trade/presentation/components/trade_markets_widget.dart';

import 'components/market_symbol_row.dart';

class TradePage extends StatefulWidget {
  const TradePage({Key? key}) : super(key: key);

  @override
  State<TradePage> createState() => _TradePageState();
}

class _TradePageState extends State<TradePage> {
  @override
  void didChangeDependencies() {
    BlocProvider.of<TradeBloc>(context).add(InitializeTrade());
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TradeBloc, TradeState>(
      builder: (context, state) {
        if (state.isLoading || state.hasError) {
          return Scaffold(
            body: Center(
              child: state.isLoading
                  ? CircularProgressIndicator.adaptive()
                  : Text(state.error.toString()),
            ),
          );
        }

        return DefaultTabController(
          length: state.markets.length,
          child: Scaffold(
            appBar: AppBar(
              title: TradeMarketsWidget(
                markets: state.markets,
                onMarketSelected: (market) => {
                  BlocProvider.of<TradeBloc>(context).add(
                    OnMarketChosen(market),
                  ),
                },
              ),
            ),
            body: ListView.separated(
              separatorBuilder: (_, __) => Divider(color: Colors.white24),
              itemCount: state.filteredSymbols.length,
              itemBuilder: (context, index) => MarketSymbolRow(
                key: Key("${state.filteredSymbols[index].symbol}-row"),
                symbol: state.filteredSymbols[index],
              ),
            ),
          ),
        );
      },
    );
  }
}
