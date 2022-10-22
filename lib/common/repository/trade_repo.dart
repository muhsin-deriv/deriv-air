import 'dart:convert';

import 'package:price_tracker/common/models/proposal_model.dart';
import 'package:price_tracker/common/models/symbol_model.dart';
import 'package:price_tracker/common/repository/base_repo.dart';

class TradeRepo extends BaseRepo {
  Future<List<Symbol>> getSymbols() async {
    final key = "active_symbols";
    final data = await callAndWaitForData(
      key,
      jsonEncode({"active_symbols": "brief", "product_type": "basic"}),
    );
    final List<Symbol> symbols =
        data[key].map<Symbol>((symbol) => Symbol.fromJson(symbol)).toList();
    return symbols;
  }

  Future<Proposal> getProposal({
    required String symbol,
    required String contractType,
    required double amount,
  }) async {
    final key = "proposal";
    final data = await callAndWaitForData(
      key,
      jsonEncode({
        "proposal": 1,
        "amount": amount,
        "barrier": "+0.1",
        "basis": "payout",
        "contract_type": contractType,
        "currency": "USD",
        "duration": 60,
        "duration_unit": "s",
        "symbol": symbol,
      }),
    );
    return Proposal.fromJson(data['proposal']);
  }

  Future<void> buyProposal(Proposal proposal, double amount) async {
    final key = "buy";

    await callAndWaitForData(
      key,
      jsonEncode({"buy": proposal.id, "price": amount}),
    );
  }
}
