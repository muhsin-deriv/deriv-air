import 'package:price_tracker/common/utils/enum_helpers.dart';

import 'market_model.dart';

enum SymbolType {
  forexBasket,
  forex,
  stockindex,
  cryptocurrency,
  none,
  commodityBasket,
  commodities,
}

class Symbol {
  Symbol({
    required this.allowForwardStarting,
    required this.displayName,
    required this.exchangeIsOpen,
    required this.isTradingSuspended,
    required this.market,
    required this.pip,
    required this.submarket,
    required this.submarketDisplayName,
    required this.symbol,
    required this.symbolType,
  });

  final bool allowForwardStarting;
  final String displayName;
  final bool exchangeIsOpen;
  final bool isTradingSuspended;
  final Market market;
  final double pip;
  final String submarket;
  final String submarketDisplayName;
  final String symbol;
  final SymbolType symbolType;

  factory Symbol.fromJson(Map<String, dynamic> json) => Symbol(
        allowForwardStarting: json["allow_forward_starting"] == 1,
        displayName: json["display_name"],
        exchangeIsOpen: json["exchange_is_open"] == 1,
        isTradingSuspended: json["is_trading_suspended"] == 1,
        market: Market(
          displayName: json["market_display_name"],
          key: json["market"],
        ),
        pip: json["pip"].toDouble(),
        submarket: json["submarket"],
        submarketDisplayName: json["submarket_display_name"],
        symbol: json["symbol"],
        symbolType: symbolTypeValues.map[json["symbol_type"]]!,
      );

  @override
  String toString() {
    return 'Symbol(displayName: $displayName, symbol: $symbol)';
  }
}

final symbolTypeValues = EnumValues({
  "commodities": SymbolType.commodities,
  "commodity_basket": SymbolType.commodityBasket,
  "cryptocurrency": SymbolType.cryptocurrency,
  "": SymbolType.none,
  "forex": SymbolType.forex,
  "forex_basket": SymbolType.forexBasket,
  "stockindex": SymbolType.stockindex
});
