import 'package:flutter/material.dart';

class TradeMarketsWidget extends StatelessWidget {
  final List<String> markets;

  const TradeMarketsWidget({Key? key, required this.markets}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TabBar(
      labelColor: Colors.white,
      indicatorColor: Colors.red,
      isScrollable: true,
      tabs: markets.map((market) => Tab(text: market.toString())).toList(),
    );
  }
}
