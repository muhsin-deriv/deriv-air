import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:price_tracker/features/trade/bloc/trade_bloc.dart';
import 'package:price_tracker/features/transactions/presentation/transactions_page.dart';

import 'trade/presentation/trade_page.dart';

class TabPage extends StatelessWidget {
  const TabPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        bottomNavigationBar: Container(
          child: SafeArea(
            child: TabBar(
              indicatorColor: Colors.transparent,
              tabs: [
                Tab(
                  icon: Icon(Icons.show_chart),
                  text: "Trade",
                ),
                Tab(
                  icon: Icon(Icons.format_list_bulleted),
                  text: "Transactions",
                ),
              ],
            ),
          ),
        ),
        body: TabBarView(children: [
          // Trade Page
          TradePage(),

          // Transactions
          TransactionsPage(),
        ]),
      ),
    );
  }
}
