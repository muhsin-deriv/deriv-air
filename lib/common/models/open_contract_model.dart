class OpenContract {
  OpenContract({
    required this.accountId,
    this.auditDetails,
    this.barrier,
    this.barrierCount,
    required this.bidPrice,
    required this.buyPrice,
    required this.contractId,
    required this.contractType,
    required this.currency,
    required this.currentSpot,
    required this.currentSpotDisplayValue,
    required this.currentSpotTime,
    required this.dateExpiry,
    required this.dateSettlement,
    required this.dateStart,
    required this.displayName,
    required this.entrySpot,
    this.entrySpotDisplayValue,
    required this.entryTick,
    this.entryTickDisplayValue,
    this.entryTickTime,
    required this.exitTick,
    this.exitTickDisplayValue,
    this.exitTickTime,
    required this.expiryTime,
    required this.id,
    required this.isExpired,
    required this.isForwardStarting,
    required this.isIntraday,
    required this.isPathDependent,
    required this.isSettleable,
    required this.isSold,
    required this.isValidToCancel,
    required this.isValidToSell,
    required this.longcode,
    required this.payout,
    required this.profit,
    required this.profitPercentage,
    required this.purchaseTime,
    required this.sellPrice,
    required this.sellSpot,
    this.sellSpotDisplayValue,
    this.sellSpotTime,
    this.sellTime,
    required this.shortcode,
    required this.status,
    required this.transactionIds,
    required this.underlying,
    this.validationError,
  });

  final int accountId;
  final AuditDetails? auditDetails;
  final String? barrier;
  final int? barrierCount;
  final double bidPrice;
  final double buyPrice;
  final int contractId;
  final String contractType;
  final String currency;
  final double currentSpot;
  final String currentSpotDisplayValue;
  final int currentSpotTime;
  final int dateExpiry;
  final int dateSettlement;
  final int dateStart;
  final String displayName;
  final double entrySpot;
  final String? entrySpotDisplayValue;
  final double entryTick;
  final String? entryTickDisplayValue;
  final int? entryTickTime;
  final double exitTick;
  final String? exitTickDisplayValue;
  final int? exitTickTime;
  final int expiryTime;
  final String id;
  final int isExpired;
  final int isForwardStarting;
  final int isIntraday;
  final int isPathDependent;
  final int isSettleable;
  final int isSold;
  final int isValidToCancel;
  final int isValidToSell;
  final String longcode;
  final double payout;
  final double profit;
  final double profitPercentage;
  final int purchaseTime;
  final double sellPrice;
  final double sellSpot;
  final String? sellSpotDisplayValue;
  final int? sellSpotTime;
  final int? sellTime;
  final String shortcode;
  final String status;
  final TransactionIds transactionIds;
  final String underlying;
  final String? validationError;

  factory OpenContract.fromJson(Map<String, dynamic> json) => OpenContract(
        accountId: json["account_id"],
        auditDetails: json["audit_details"] != null
            ? AuditDetails.fromJson(json["audit_details"])
            : null,
        barrier: json["barrier"],
        barrierCount: json["barrier_count"],
        bidPrice: (json["bid_price"] ?? 0).toDouble(),
        buyPrice: (json["buy_price"] ?? 0).toDouble(),
        contractId: json["contract_id"],
        contractType: json["contract_type"],
        currency: json["currency"],
        currentSpot: (json["current_spot"] ?? 0).toDouble(),
        currentSpotDisplayValue: json["current_spot_display_value"],
        currentSpotTime: json["current_spot_time"],
        dateExpiry: json["date_expiry"],
        dateSettlement: json["date_settlement"],
        dateStart: json["date_start"],
        displayName: json["display_name"],
        entrySpot: (json["entry_spot"] ?? 0).toDouble(),
        entrySpotDisplayValue: json["entry_spot_display_value"],
        entryTick: (json["entry_tick"] ?? 0).toDouble(),
        entryTickDisplayValue: json["entry_tick_display_value"],
        entryTickTime: json["entry_tick_time"],
        exitTick: (json["exit_tick"] ?? 0).toDouble(),
        exitTickDisplayValue: json["exit_tick_display_value"],
        exitTickTime: json["exit_tick_time"],
        expiryTime: json["expiry_time"],
        id: json["id"],
        isExpired: json["is_expired"],
        isForwardStarting: json["is_forward_starting"],
        isIntraday: json["is_intraday"],
        isPathDependent: json["is_path_dependent"],
        isSettleable: json["is_settleable"],
        isSold: json["is_sold"],
        isValidToCancel: json["is_valid_to_cancel"],
        isValidToSell: json["is_valid_to_sell"],
        longcode: json["longcode"],
        payout: (json["payout"] ?? 0).toDouble(),
        profit: (json["profit"] ?? 0).toDouble(),
        profitPercentage: (json["profit_percentage"] ?? 0).toDouble(),
        purchaseTime: json["purchase_time"],
        sellPrice: (json["sell_price"] ?? 0).toDouble(),
        sellSpot: (json["sell_spot"] ?? 0).toDouble(),
        sellSpotDisplayValue: json["sell_spot_display_value"] ?? '',
        sellSpotTime: json["sell_spot_time"],
        sellTime: json["sell_time"],
        shortcode: json["shortcode"],
        status: json["status"],
        transactionIds: TransactionIds.fromJson(json["transaction_ids"]),
        underlying: json["underlying"],
        validationError: json["validation_error"],
      );
}

class AuditDetails {
  AuditDetails({
    required this.contractStart,
  });

  final List<ContractStart> contractStart;

  factory AuditDetails.fromJson(Map<String, dynamic> json) => AuditDetails(
        contractStart: List<ContractStart>.from(
            json["contract_start"].map((x) => ContractStart.fromJson(x))),
      );
}

class ContractStart {
  ContractStart({
    this.epoch,
    this.tick,
    this.tickDisplayValue,
    this.flag,
    this.name,
  });

  final int? epoch;
  final double? tick;
  final String? tickDisplayValue;
  final String? flag;
  final String? name;

  factory ContractStart.fromJson(Map<String, dynamic> json) => ContractStart(
        epoch: json["epoch"],
        tick: (json["tick"] ?? 0).toDouble(),
        tickDisplayValue: json["tick_display_value"],
        flag: json["flag"] == null ? null : json["flag"],
        name: json["name"] == null ? null : json["name"],
      );
}

class TransactionIds {
  TransactionIds({
    required this.buy,
    required this.sell,
  });

  final int buy;
  final int? sell;

  factory TransactionIds.fromJson(Map<String, dynamic> json) => TransactionIds(
        buy: json["buy"],
        sell: json["sell"],
      );
}
