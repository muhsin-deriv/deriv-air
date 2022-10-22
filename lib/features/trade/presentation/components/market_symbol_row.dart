import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:price_tracker/features/create_trade/bloc/create_trade_bloc.dart';
import 'package:price_tracker/features/create_trade/presentation/create_trade_page.dart';
import 'package:price_tracker/features/tick_component/tick_component.dart';

import 'package:price_tracker/common/models/symbol_model.dart';

class MarketSymbolRow extends StatefulWidget {
  final Symbol symbol;

  const MarketSymbolRow({
    Key? key,
    required this.symbol,
  }) : super(key: key);

  @override
  State<MarketSymbolRow> createState() => _MarketSymbolRowState();
}

class _MarketSymbolRowState extends State<MarketSymbolRow> {
  bool canTrade = false;

  void onTap(BuildContext context) {
    if (!canTrade) {
      Fluttertoast.showToast(
        msg: "Market is currently unavailable",
        gravity: ToastGravity.CENTER,
        backgroundColor: Colors.white10,
      );
      return;
    }

    showTradeSheet(context);
  }

  void showTradeSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) => GestureDetector(
        child: Container(
          child: BlocProvider(
            create: (_) => CreateTradeBloc(widget.symbol),
            child: CreateTradePage(),
          ),
          color: Colors.transparent,
        ),
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Row(
        children: [
          Text(widget.symbol.displayName),
          Spacer(),
          TickComponent(
            symbol: widget.symbol.symbol,
            key: Key(widget.symbol.symbol),
            onTick: (_) {
              setState(() {
                canTrade = true;
              });
            },
          ),
          SizedBox(width: 20),
        ],
      ),
      trailing: Icon(Icons.chevron_right),
      onTap: () => onTap(context),
    );
  }
}
