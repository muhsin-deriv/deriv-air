import 'duration_type_enum.dart';

class ProfitTableItem {
  ProfitTableItem({
    required this.appId,
    required this.buyPrice,
    required this.contractId,
    required this.durationType,
    required this.longCode,
    required this.payout,
    required this.purchaseTime,
    required this.sellPrice,
    required this.sellTime,
    required this.shortCode,
    required this.transactionId,
  });

  final int appId;
  final double buyPrice;
  final int contractId;
  final DurationType durationType;
  final String longCode;
  final double payout;
  final int purchaseTime;
  final double sellPrice;
  final int sellTime;
  final String shortCode;
  final int transactionId;

  factory ProfitTableItem.fromJson(Map<String, dynamic> json) =>
      ProfitTableItem(
        appId: json["app_id"],
        buyPrice: json["buy_price"].toDouble(),
        contractId: json["contract_id"],
        durationType: durationTypeValues.map[json["duration_type"]] ??
            DurationType.MINUTES,
        longCode: json["longcode"],
        payout: json["payout"].toDouble(),
        purchaseTime: json["purchase_time"],
        sellPrice: json["sell_price"].toDouble(),
        sellTime: json["sell_time"],
        shortCode: json["shortcode"],
        transactionId: json["transaction_id"],
      );

  Map<String, dynamic> toJson() => {
        "app_id": appId,
        "buy_price": buyPrice,
        "contract_id": contractId,
        "duration_type": durationTypeValues.reverse[durationType],
        "longcode": longCode,
        "payout": payout,
        "purchase_time": purchaseTime,
        "sell_price": sellPrice,
        "sell_time": sellTime,
        "shortcode": shortCode,
        "transaction_id": transactionId,
      };
}
