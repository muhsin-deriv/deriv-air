class Transaction {
  Transaction({
    required this.action,
    required this.amount,
    required this.balance,
    required this.barrier,
    required this.contractId,
    required this.currency,
    required this.dateExpiry,
    required this.displayName,
    required this.id,
    required this.longcode,
    required this.symbol,
    required this.transactionId,
    required this.transactionTime,
  });

  final String action;
  final double amount;
  final double balance;
  final String barrier;
  final int contractId;
  final String currency;
  final int dateExpiry;
  final String displayName;
  final String id;
  final String longcode;
  final String symbol;
  final int transactionId;
  final int transactionTime;

  factory Transaction.fromJson(Map<String, dynamic> json) => Transaction(
        action: json["action"],
        amount: json["amount"].toDouble(),
        balance: json["balance"].toDouble(),
        barrier: json["barrier"],
        contractId: json["contract_id"],
        currency: json["currency"],
        dateExpiry: json["date_expiry"],
        displayName: json["display_name"],
        id: json["id"],
        longcode: json["longcode"],
        symbol: json["symbol"],
        transactionId: json["transaction_id"],
        transactionTime: json["transaction_time"],
      );
}
