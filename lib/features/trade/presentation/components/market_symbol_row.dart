import 'package:flutter/material.dart';

class MarketSymbolRow extends StatelessWidget {
  const MarketSymbolRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Row(
        children: [
          Text('Symbol name'),
          Spacer(),
          Text('Price'),
          SizedBox(width: 50),
        ],
      ),
      trailing: Icon(Icons.chevron_right),
      onTap: () {},
    );
  }
}
