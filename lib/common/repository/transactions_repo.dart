import 'dart:convert';

import 'package:price_tracker/common/models/profit_table_item.dart';
import 'package:price_tracker/common/repository/base_repo.dart';

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
}
