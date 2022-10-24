import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:price_tracker/features/transactions/presentation/components/transaction_type_header.dart';

import '../bloc/transactions_bloc.dart';
import 'components/closed_transaction_card.dart';
import 'components/open_transaction_card.dart';

class TransactionsPage extends StatefulWidget {
  const TransactionsPage({Key? key}) : super(key: key);

  @override
  State<TransactionsPage> createState() => _TransactionsPageState();
}

class _TransactionsPageState extends State<TransactionsPage> {
  @override
  void didChangeDependencies() {
    BlocProvider.of<TransactionsBloc>(context).add(InitializeTransactions());
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TransactionsBloc, TransactionsState>(
      builder: (context, state) {
        if (state.isLoading || state.hasError) {
          return Center(
              child: state.hasError
                  ? Text(state.error.toString())
                  : CircularProgressIndicator.adaptive());
        }

        return CustomScrollView(
          slivers: [
            if (state.openPositions.isNotEmpty) ...[
              TransactionTypeHeader(title: "Open Positions"),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) => OpenTransactionCard(),
                  childCount: 2,
                ),
              ),
            ],

            // Closed
            TransactionTypeHeader(title: "Closed Positions"),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) => ClosedTransactionCard(
                  transaction: state.closedPositions.elementAt(index),
                ),
                childCount: state.closedPositions.length,
              ),
            ),
          ],
        );
      },
    );
  }
}
