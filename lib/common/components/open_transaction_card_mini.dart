import 'package:flutter/material.dart';

import 'package:price_tracker/common/components/pnl_component.dart';
import 'package:price_tracker/common/components/trade_duration_type.dart';
import 'package:price_tracker/common/models/open_contract_model.dart';

class OpenTransactionCardMini extends StatelessWidget {
  final OpenContract contract;

  const OpenTransactionCardMini({
    Key? key,
    required this.contract,
  }) : super(key: key);

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
              "Buy \$${contract.buyPrice.toStringAsFixed(2)}",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            TradeDurationTypePill(title: contract.contractType),
            PnLComponent(profit: contract.profit),
          ],
        ),
      ),
    );
  }
}
