import 'package:flutter/material.dart';

import 'package:price_tracker/features/trade/presentation/components/trade_bottom_sheet.dart';
import 'package:price_tracker/common/models/symbol_model.dart';

class MarketSymbolRow extends StatelessWidget {
  final Symbol symbol;

  const MarketSymbolRow({
    Key? key,
    required this.symbol,
  }) : super(key: key);

  void showTradeSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) => GestureDetector(
        child: Container(
          child: TradeBottomSheet(),
          color: Colors.transparent,
        ),
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Row(
        children: [
          Text(symbol.displayName),
          Spacer(),
          Text(symbol.symbol),
          SizedBox(width: 50),
        ],
      ),
      trailing: Icon(Icons.chevron_right),
      onTap: () => showTradeSheet(context),
    );
  }
}
