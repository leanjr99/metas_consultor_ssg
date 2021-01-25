import 'package:meta/meta.dart';
import 'package:flutter/foundation.dart';

class TransactionModel {

  final String name;
  final DateTime date;
  final int amount;

  const TransactionModel({

    @required this.name,
    @required this.date,
    @required this.amount,
  });
}
