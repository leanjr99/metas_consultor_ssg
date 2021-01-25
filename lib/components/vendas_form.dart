import 'package:flutter/material.dart';
import 'transaction_list.dart';

class VendasForm extends StatelessWidget {
  final titleController = TextEditingController();
  final valueController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return  Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(children: <Widget>[
          TextField(
            controller: titleController,
            decoration: InputDecoration(
              labelText: 'Titulo',
            ),
          ),
          TextField(
            controller: valueController,
            decoration: InputDecoration(
              labelText: 'Valor(R\$)',
            ),
          ),
          FlatButton(
            child: Text('Adicionar Venda'),
            onPressed: () {
              print(titleController.text);
              print(valueController.text);
            },
          )
        ]),
      ),
    );
  }
}
