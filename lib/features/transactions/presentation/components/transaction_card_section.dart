import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionCardSection extends StatelessWidget {
  final String title;
  final double price;
  final DateTime dateTime;

  const TransactionCardSection({
    Key? key,
    required this.title,
    required this.price,
    required this.dateTime,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title, style: Theme.of(context).textTheme.bodyLarge),
            Text(
              '\$${price.toStringAsFixed(2)}',
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  color: Color.fromRGBO(255, 255, 255, 1),
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
        SizedBox(height: 8),
        Text(
          "at ${DateFormat('hh:mm a, dd MMM yyy').format(dateTime)}",
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ],
    );
  }
}
