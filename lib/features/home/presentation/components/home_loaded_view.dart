import 'package:flutter/material.dart';

import 'package:price_tracker/common/models/symbol_model.dart';
import 'package:price_tracker/features/home/bloc/home_bloc.dart';
import 'package:price_tracker/features/tick_component/tick_component.dart';

import '../../../../common/models/market_model.dart';

class HomeLoadedView extends StatelessWidget {
  final LoadedHomeState state;
  final Function(Market?) onMarketChanged;
  final Function(Symbol?) onSymbolChanged;
  const HomeLoadedView({
    Key? key,
    required this.state,
    required this.onMarketChanged,
    required this.onSymbolChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(16),
      children: [
        // Dropdown  for Markets
        DropdownButton<Market>(
          isExpanded: true,
          hint: Text('Select a Market'),
          items: state.uniqueMarkets
              .map<DropdownMenuItem<Market>>((e) => DropdownMenuItem<Market>(
                    value: e,
                    child: Text(e.toString()),
                  ))
              .toList(),
          value: state.selectedMarket,
          onChanged: onMarketChanged,
        ),

        // Dropdown for symbols
        if (state.selectedMarket != null)
          DropdownButton<Symbol>(
            isExpanded: true,
            hint: Text('Select a Symbol'),
            items: state.filteredSymbols
                .map<DropdownMenuItem<Symbol>>((e) => DropdownMenuItem<Symbol>(
                      value: e,
                      child: Text(e.displayName),
                    ))
                .toList(),
            value: state.selectedSymbol,
            onChanged: onSymbolChanged,
          ),

        /// Component responsible for tick updates
        if (state.selectedSymbol != null)
          TickComponent(
            symbol: state.selectedSymbol!.symbol,
            key: Key(state.selectedSymbol?.symbol ?? ''),
          ),
      ],
    );
  }
}
