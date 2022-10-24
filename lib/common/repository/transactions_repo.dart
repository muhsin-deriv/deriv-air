import 'dart:convert';

import 'package:price_tracker/common/models/portfolio_model.dart';
import 'package:price_tracker/common/models/profit_table_item.dart';
import 'package:price_tracker/common/models/trnsaction_model.dart';
import 'package:price_tracker/common/repository/base_repo.dart';

import 'api_connection.dart';

class TransactionsRepo extends BaseRepo {
  Future<List<ProfitTableItem>> getClosedPositions() async {
    final key = "profit_table";
    final data = await callAndWaitForData(
      key,
      jsonEncode({"profit_table": 1, "description": 1, "sort": "DESC"}),
    );
    return data[key]['transactions']
        .map<ProfitTableItem>((symbol) => ProfitTableItem.fromJson(symbol))
        .toList();
  }

  Stream<Transaction> transactionStream() =>
      ApiConnection.instance.stream.where((event) {
        final parsedEvent = jsonDecode(event);
        if (parsedEvent['msg_type'] != 'transaction' ||
            parsedEvent['transaction']['action'] == null) {
          return false;
        }

        try {
          Transaction.fromJson(parsedEvent['transaction']);
          return true;
        } catch (_) {
          return false;
        }
      }).map(
        (event) => Transaction.fromJson(jsonDecode(event)['transaction']),
      );

  Future<List<Portfolio>> getOpenPortfolio() async {
    final key = "portfolio";
    final data = await callAndWaitForData(
      key,
      jsonEncode({"portfolio": 1}),
    );
    return data[key]['contracts']
        .map<Portfolio>((symbol) => Portfolio.fromJson(symbol))
        .toList();
  }
}
