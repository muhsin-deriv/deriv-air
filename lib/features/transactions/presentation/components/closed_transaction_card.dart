import 'package:flutter/material.dart';
import 'package:price_tracker/features/transactions/presentation/components/trade_duration_type.dart';
import 'package:price_tracker/features/transactions/presentation/components/transaction_card_section.dart';

class ClosedTransactionCard extends StatelessWidget {
  const ClosedTransactionCard({Key? key}) : super(key: key);

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
            Row(
              children: [
                Expanded(
                  child: TransactionCardSection(
                    dateTime: DateTime.now(),
                    price: 11.99,
                    title: 'BUY',
                  ),
                ),
                Container(
                  height: 50,
                  margin: EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    border: Border(
                      right: BorderSide(
                        color: Colors.white12,
                        width: 1,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: TransactionCardSection(
                    dateTime: DateTime.now(),
                    price: 9.99,
                    title: 'SELL',
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TradeDurationTypePill(title: "Ticks"),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text("P/L: ", style: Theme.of(context).textTheme.bodySmall),
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
