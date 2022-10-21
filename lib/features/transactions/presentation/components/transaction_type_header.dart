import 'package:flutter/material.dart';

class TransactionTypeHeader extends StatelessWidget {
  final String title;

  const TransactionTypeHeader({Key? key, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          title,
          style: Theme.of(context).textTheme.titleLarge,
        ),
      )),
    );
  }
}
