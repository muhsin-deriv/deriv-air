class Portfolio {
  Portfolio({
    required this.appId,
    required this.buyPrice,
    required this.contractId,
    required this.contractType,
    required this.currency,
    required this.dateStart,
    required this.expiryTime,
    required this.longcode,
    required this.payout,
    required this.purchaseTime,
    required this.shortcode,
    required this.symbol,
    required this.transactionId,
  });

  final int appId;
  final double buyPrice;
  final int contractId;
  final String contractType;
  final String currency;
  final int dateStart;
  final int expiryTime;
  final String longcode;
  final double payout;
  final int purchaseTime;
  final String shortcode;
  final String symbol;
  final int transactionId;

  factory Portfolio.fromJson(Map<String, dynamic> json) => Portfolio(
        appId: json["app_id"],
        buyPrice: (json["buy_price"] ?? 0).toDouble(),
        contractId: json["contract_id"],
        contractType: json["contract_type"],
        currency: json["currency"],
        dateStart: json["date_start"],
        expiryTime: json["expiry_time"],
        longcode: json["longcode"],
        payout: json["payout"].toDouble(),
        purchaseTime: json["purchase_time"],
        shortcode: json["shortcode"],
        symbol: json["symbol"],
        transactionId: json["transaction_id"],
      );
}
