import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:price_tracker/features/transactions/presentation/components/transaction_type_header.dart';

import '../bloc/transactions_bloc.dart';
import 'components/closed_transaction_card.dart';
import 'components/open_transaction_card.dart';

class TransactionsPage extends StatelessWidget {
  const TransactionsPage({Key? key}) : super(key: key);

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

        return RefreshIndicator(
          onRefresh: () {
            BlocProvider.of<TransactionsBloc>(context)
                .add(InitializeTransactions());
            return Future.delayed(Duration(seconds: 1));
          },
          child: CustomScrollView(
            slivers: [
              if (state.openContractIds.isNotEmpty) ...[
                TransactionTypeHeader(title: "Open Positions"),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      final contract = state.openContracts[
                          state.openContractIds.elementAt(index)];
                      if (contract == null) {
                        return SizedBox.shrink();
                      }

                      return OpenTransactionCard(
                        openContract: contract,
                        key: Key(contract.contractId.toString()),
                      );
                    },
                    childCount: state.openContractIds.length,
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
          ),
        );
      },
    );
  }
}
