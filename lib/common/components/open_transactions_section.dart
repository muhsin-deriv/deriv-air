import 'package:flutter/material.dart';

import 'open_transaction_card_mini.dart';

class OpenTransactionPreview extends StatelessWidget {
  const OpenTransactionPreview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return SizedBox.shrink();
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
          OpenTransactionCardMini(),
          OpenTransactionCardMini(),
          SizedBox(height: 4),
          Text(
            "2 more open positions.",
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ],
      ),
    );
  }
}
