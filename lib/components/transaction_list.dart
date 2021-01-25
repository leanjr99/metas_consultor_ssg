import 'package:flutter/material.dart';
import 'package:metas_consultor_ssg/transaction_model.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  static const Color _primaryColor = Colors.deepPurpleAccent;
  static const Color _secondaryColor = Colors.deepOrangeAccent;

  final List<TransactionModel> transactions;
TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: transactions.map((tr) {
        return Card(
          child: Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: _secondaryColor,
                    width: 2,
                  ),
                ),
                padding: EdgeInsets.all(10),
                child: Text(
                  'R\$ ${tr.amount.toStringAsFixed(2)}',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: _primaryColor,
                  ),
                ),
              ),
              Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      tr.name,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(DateFormat('d MMM y').format(tr.date),
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey[400],
                        )),
                  ]),
            ],
          ),
        );
      }).toList(),
    );
  }
}





