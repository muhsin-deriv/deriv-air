import 'package:flutter/material.dart';

import '../../../../common/models/market_model.dart';

class TradeMarketsWidget extends StatelessWidget {
  final List<Market> markets;
  final Function(Market) onMarketSelected;

  const TradeMarketsWidget({
    Key? key,
    required this.markets,
    required this.onMarketSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TabBar(
      onTap: ((value) => onMarketSelected(markets.elementAt(value))),
      labelColor: Colors.white,
      indicatorColor: Colors.red,
      isScrollable: true,
      tabs: markets.map((market) => Tab(text: market.displayName)).toList(),
    );
  }
}
