import 'package:flutter/material.dart';
import 'package:price_tracker/features/trade/presentation/components/trade_bottom_sheet.dart';

class MarketSymbolRow extends StatelessWidget {
  const MarketSymbolRow({Key? key}) : super(key: key);

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
          Text('Symbol name'),
          Spacer(),
          Text('Price'),
          SizedBox(width: 50),
        ],
      ),
      trailing: Icon(Icons.chevron_right),
      onTap: () => showTradeSheet(context),
    );
  }
}
