import 'package:flutter/material.dart';
import 'package:price_tracker/features/transactions/presentation/components/transaction_type_header.dart';

import 'components/closed_transaction_card.dart';
import 'components/open_transaction_card.dart';

class TransactionsPage extends StatelessWidget {
  const TransactionsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        TransactionTypeHeader(title: "Open Positions"),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) => OpenTransactionCard(),
            childCount: 2,
          ),
        ),

        // Closed
        TransactionTypeHeader(title: "Closed Positions"),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) => ClosedTransactionCard(),
            childCount: 10,
          ),
        ),
      ],
    );
  }
}
