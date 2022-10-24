import 'package:flutter/material.dart';
import 'package:price_tracker/common/models/duration_type_enum.dart';

import 'package:price_tracker/common/models/profit_table_item.dart';
import 'package:price_tracker/features/transactions/presentation/components/trade_duration_type.dart';
import 'package:price_tracker/features/transactions/presentation/components/transaction_card_section.dart';

class ClosedTransactionCard extends StatelessWidget {
  final ProfitTableItem transaction;

  const ClosedTransactionCard({
    Key? key,
    required this.transaction,
  }) : super(key: key);

  void onInfoPressed(BuildContext context) {
    showDialog(
      barrierDismissible: true,
      context: context,
      builder: (_) {
        return AlertDialog(
          content: Text(transaction.longCode),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Okay'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final profit = transaction.sellPrice - transaction.buyPrice;

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
                  "Ref ID: ${transaction.contractId}",
                  style: Theme.of(context).textTheme.labelSmall,
                ),
                IconButton(
                    onPressed: () => onInfoPressed(context),
                    icon: Icon(Icons.info_outline)),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: TransactionCardSection(
                    dateTime: DateTime.fromMillisecondsSinceEpoch(
                        transaction.purchaseTime * 1000),
                    price: transaction.buyPrice,
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
                    dateTime: DateTime.fromMillisecondsSinceEpoch(
                        transaction.sellTime * 1000),
                    price: transaction.sellPrice,
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
                TradeDurationTypePill(
                  title: transaction.durationType.toDisplayString(),
                ),
                Container(
                  // color: Colors.red,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("P/L: ",
                          style: Theme.of(context).textTheme.bodySmall),
                      Text(
                        profit.toStringAsFixed(2),
                        style:
                            Theme.of(context).textTheme.titleMedium!.copyWith(
                                  color: profit == 0
                                      ? Colors.grey
                                      : profit < 1
                                          ? Colors.red
                                          : Colors.green,
                                  fontWeight: FontWeight.bold,
                                ),
                      ),
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
