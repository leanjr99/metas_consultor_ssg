import 'package:flutter/material.dart';
import 'vendas_form.dart';
import 'transaction_list.dart';
import '../transaction_model.dart';

class TransactionUser extends StatefulWidget {
  @override
  _TransactionUserState createState() => _TransactionUserState();
}

class _TransactionUserState extends State<TransactionUser> {

  final _transactionList = [
    TransactionModel(
      name: "S20",
      date: DateTime.now(),
      amount: 4500,
    ),
    TransactionModel(
      name: "s20 fe",
      date: DateTime.now(),
      amount: 2500,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TransactionList(_transactionList),
        VendasForm(),
      ],
    );
  }
}
