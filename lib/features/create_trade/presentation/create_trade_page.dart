import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:price_tracker/common/components/common_button.dart';
import 'package:price_tracker/common/models/contract_type_enum.dart';
import 'package:price_tracker/features/tick_component/tick_component.dart';

import '../bloc/create_trade_bloc.dart';

class CreateTradePage extends StatefulWidget {
  const CreateTradePage({
    Key? key,
  }) : super(key: key);

  @override
  State<CreateTradePage> createState() => _CreateTradePageState();
}

class _CreateTradePageState extends State<CreateTradePage> {
  final double initialAmount = 1;
  late TextEditingController amountController;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    amountController =
        TextEditingController(text: initialAmount.toStringAsFixed(0));
    createProposals();
  }

  void createProposals() {
    final bloc = BlocProvider.of<CreateTradeBloc>(context);
    final symbol = bloc.symbol;
    bloc.add(CreateProposal(
      symbol: symbol.symbol,
      contractType: ContractType.buy,
      amount: initialAmount,
    ));
    bloc.add(CreateProposal(
      symbol: symbol.symbol,
      contractType: ContractType.sell,
      amount: initialAmount,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.all(16),
        child: BlocBuilder<CreateTradeBloc, CreateTradeState>(
          builder: (context, state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      state.symbol.displayName,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    TickComponent(symbol: state.symbol.symbol),
                  ],
                ),
                SizedBox(height: 20),
                TextField(
                  controller: amountController,
                  autofocus: true,
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Amount",
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    if (state.buyProposal != null)
                      Expanded(
                        child: CustomButton(
                          title: "BUY",
                          color: Colors.green,
                          onPressed: () {
                            BlocProvider.of<CreateTradeBloc>(context).add(
                              BuyProposal(
                                proposal: state.buyProposal!,
                                amount: double.parse(amountController.text),
                              ),
                            );
                          },
                        ),
                      ),
                    SizedBox(width: 10),
                    if (state.sellProposal != null)
                      Expanded(
                        child: CustomButton(
                          title: "SELL",
                          color: Colors.red,
                          onPressed: () {
                            BlocProvider.of<CreateTradeBloc>(context).add(
                              BuyProposal(
                                proposal: state.sellProposal!,
                                amount: double.parse(amountController.text),
                              ),
                            );
                          },
                        ),
                      ),
                  ],
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
