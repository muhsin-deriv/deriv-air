import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/transactions/bloc/transactions_bloc.dart';
import 'open_transaction_card_mini.dart';

class OpenTransactionPreview extends StatelessWidget {
  const OpenTransactionPreview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TransactionsBloc, TransactionsState>(
      builder: (context, state) {
        if (state.openContractIds.isEmpty ||
            state.openContracts.values.isEmpty) {
          return SizedBox.shrink();
        }

        final count = state.openContractIds.length;
        final hasMoreThan2 = count > 2;

        return Container(
          color: Colors.white10,
          padding: const EdgeInsets.all(16),
          margin: EdgeInsets.only(bottom: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Open Positions",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              SizedBox(height: 10),
              ...state.openContractIds
                  .sublist(0, min(2, state.openContractIds.length))
                  .map((id) {
                final contract = state.openContracts[id];
                if (contract == null) {
                  return SizedBox.shrink();
                }

                return OpenTransactionCardMini(
                  contract: contract,
                  key: Key("${contract.contractId}-mini"),
                );
              }),
              SizedBox(height: 4),
              if (hasMoreThan2)
                Text(
                  "${count - 2} more open position${(count - 2) == 0 ? '' : 's'}.",
                  style: Theme.of(context).textTheme.bodySmall,
                ),
            ],
          ),
        );
      },
    );
  }
}
