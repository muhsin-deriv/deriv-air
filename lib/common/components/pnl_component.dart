import 'package:flutter/material.dart';
import 'package:price_tracker/common/components/trade_duration_type.dart';

class PnLComponent extends StatelessWidget {
  final double profit;

  const PnLComponent({
    Key? key,
    required this.profit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text("P/L: ", style: Theme.of(context).textTheme.bodySmall),
        Text(
          profit.toStringAsFixed(2),
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: profit == 0
                    ? Colors.grey
                    : profit < 1
                        ? Colors.red
                        : Colors.green,
                fontWeight: FontWeight.bold,
              ),
        ),
      ],
    );
  }
}
