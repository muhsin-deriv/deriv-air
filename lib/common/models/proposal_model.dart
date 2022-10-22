class Proposal {
  Proposal({
    required this.askPrice,
    required this.dateExpiry,
    required this.dateStart,
    required this.displayValue,
    required this.id,
    required this.longcode,
    required this.payout,
    required this.spot,
    required this.spotTime,
  });

  final double askPrice;
  final int dateExpiry;
  final int dateStart;
  final String displayValue;
  final String id;
  final String longcode;
  final int payout;
  final double spot;
  final int spotTime;

  factory Proposal.fromJson(Map<String, dynamic> json) => Proposal(
        askPrice: json["ask_price"].toDouble(),
        dateExpiry: json["date_expiry"],
        dateStart: json["date_start"],
        displayValue: json["display_value"],
        id: json["id"],
        longcode: json["longcode"],
        payout: json["payout"],
        spot: json["spot"].toDouble(),
        spotTime: json["spot_time"],
      );
}
