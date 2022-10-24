import 'package:flutter/material.dart';

class TradeDurationTypePill extends StatelessWidget {
  final String title;
  const TradeDurationTypePill({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: Colors.amber.shade300,
      ),
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 8),
      child: Text(
        title,
        style: Theme.of(context)
            .textTheme
            .bodySmall!
            .copyWith(color: Colors.black, fontWeight: FontWeight.bold),
      ),
    );
  }
}
