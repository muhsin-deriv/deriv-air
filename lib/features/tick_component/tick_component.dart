import 'dart:async';

import 'package:flutter/material.dart';
import 'package:price_tracker/common/models/tick_modal.dart';

import 'package:price_tracker/common/utils/ticker_mixin.dart';

class TickComponent extends StatefulWidget {
  final String symbol;
  final bool showIcon;
  final Function(Tick)? onTick;

  const TickComponent({
    Key? key,
    required this.symbol,
    this.showIcon = true,
    this.onTick,
  }) : super(key: key);

  @override
  _TickComponentState createState() => _TickComponentState();
}

class _TickComponentState extends State<TickComponent> with TickerMixin {
  StreamSubscription? subscription;
  Tick? lastTick;
  Tick? currentTick;

  Icon _getDirectionalIcon() {
    if (lastTick?.quote == currentTick?.quote || lastTick == null)
      return Icon(Icons.arrow_drop_down, color: Colors.transparent);
    return (lastTick?.quote ?? 0) > (currentTick?.quote ?? 0)
        ? Icon(Icons.arrow_drop_down, color: Colors.red)
        : Icon(Icons.arrow_drop_up, color: Colors.green);
  }

  @override
  void initState() {
    subscription = tickStream(widget.symbol).listen((Tick tick) {
      widget.onTick?.call(tick);
      setState(() {
        lastTick = currentTick;
        currentTick = tick;
      });
    });
    subscribeToSymbol(widget.symbol);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          currentTick?.quote.toStringAsFixed(2) ?? '--',
          style: Theme.of(context)
              .textTheme
              .bodyMedium!
              .copyWith(color: getColor()),
        ),
        if (widget.showIcon) _getDirectionalIcon(),
      ],
    );
  }

  Color getColor() {
    if (lastTick?.quote == currentTick?.quote || lastTick == null)
      return Colors.grey;
    return (lastTick?.quote ?? 0) > (currentTick?.quote ?? 0)
        ? Colors.red
        : Colors.green;
  }

  @override
  void dispose() {
    unsubscribeToSymbol(widget.symbol);
    subscription?.cancel();
    super.dispose();
  }
}
