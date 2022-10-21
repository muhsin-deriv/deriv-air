import 'package:flutter/material.dart';
import 'package:price_tracker/features/transactions/presentation/components/trade_duration_type.dart';

class OpenTransactionCard extends StatelessWidget {
  const OpenTransactionCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                  "Ref ID: 31339 ",
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
                  "\$10.00",
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
            SizedBox(height: 4),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Payout Limit",
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                Text(
                  "\$19.51",
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
            SizedBox(height: 6),
            Row(
              children: [
                Text(
                  "Indicative price",
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                Spacer(),
                Row(
                  children: [
                    Text(
                      "\$10.00",
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    Icon(
                      Icons.arrow_drop_up,
                      color: Colors.green,
                      size: 26,
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TradeDurationTypePill(title: "Minutes"),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text("Indicative P/L: ",
                        style: Theme.of(context).textTheme.bodySmall),
                    Text(
                      "+10.00",
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
