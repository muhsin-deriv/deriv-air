import 'package:flutter/material.dart';
import 'package:price_tracker/common/components/common_button.dart';

class TradeBottomSheet extends StatelessWidget {
  const TradeBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'SymbolName',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Text(
                  "+10.00",
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                      ),
                )
              ],
            ),
            SizedBox(height: 20),
            TextField(
              autofocus: true,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Amount",
              ),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: CustomButton(
                    title: "BUY",
                    color: Colors.green,
                    onPressed: () {},
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: CustomButton(
                    title: "SELL",
                    color: Colors.red,
                    onPressed: () {},
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
