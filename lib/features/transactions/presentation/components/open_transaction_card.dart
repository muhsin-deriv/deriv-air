import 'package:flutter/material.dart';
import 'package:price_tracker/common/components/pnl_component.dart';

import 'package:price_tracker/common/components/trade_duration_type.dart';
import 'package:price_tracker/common/models/open_contract_model.dart';

class OpenTransactionCard extends StatelessWidget {
  final OpenContract openContract;

  const OpenTransactionCard({
    Key? key,
    required this.openContract,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final indicativePrice = openContract.profit + openContract.buyPrice;

    return Card(
      elevation: 0,
      child: Padding(
        padding: EdgeInsets.only(left: 16, right: 16, bottom: 16, top: 10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Ref ID: ${openContract.contractId}",
                  style: Theme.of(context).textTheme.labelSmall,
                ),
                IconButton(onPressed: () {}, icon: Icon(Icons.info_outline)),
              ],
            ),
            SizedBox(height: 4),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Buy price",
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                Text(
                  "\$${openContract.buyPrice.toStringAsFixed(2)}",
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
            SizedBox(height: 2),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Payout Limit",
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                Text(
                  "\$${openContract.payout.toStringAsFixed(2)}",
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
            SizedBox(height: 8),
            Row(
              children: [
                Text(
                  "Indicative price",
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                Spacer(),
                Text(
                  "\$${indicativePrice.toStringAsFixed(2)}",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TradeDurationTypePill(title: openContract.contractType),
                PnLComponent(profit: openContract.profit),
              ],
            )
          ],
        ),
      ),
    );
  }
}
