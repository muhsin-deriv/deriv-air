import 'package:flutter/material.dart';
import 'package:price_tracker/features/trade/presentation/components/trade_markets_widget.dart';

import 'components/market_symbol_row.dart';

class TradePage extends StatelessWidget {
  const TradePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tabs = [
      'skdj',
      'sdfcsdf',
      'casdv',
      'sdfv',
      'skdj',
      'sdfcsdf',
      'casdv',
    ];

    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        appBar: AppBar(
          title: TradeMarketsWidget(markets: tabs),
        ),
        body: ListView.separated(
          separatorBuilder: (_, __) => Divider(color: Colors.white24),
          itemCount: 10,
          itemBuilder: (context, index) => MarketSymbolRow(),
        ),
      ),
    );
  }
}
