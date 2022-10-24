import 'package:flutter/material.dart';
import 'package:price_tracker/common/components/pnl_component.dart';
import 'package:price_tracker/common/components/trade_duration_type.dart';

class OpenTransactionCardMini extends StatelessWidget {
  const OpenTransactionCardMini({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white10,
      margin: EdgeInsets.only(bottom: 8),
      child: Container(
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Buy \$10.00",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            TradeDurationTypePill(title: "Minutes"),
            PnLComponent(profit: 123.99),
          ],
        ),
      ),
    );
  }
}
