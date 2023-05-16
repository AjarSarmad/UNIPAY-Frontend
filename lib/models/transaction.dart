import 'package:flutter/material.dart';

class Transaction extends StatelessWidget {
  final String acc;
  final String name;
  final String rec;
  final String rec_acc;
  final String amount;
  final String date;
  final String note;

  Transaction(
    this.name,
    this.acc,
    this.rec,
    this.rec_acc,
    this.amount,
    this.date,
    this.note,
  );

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}

final List<Transaction> credittransactions = [
  Transaction("Ahmed", "1234", "Ajar", "3456", "550", "30 July", "Hi"),
  Transaction("Hassan", "1234", "Ajar", "3456", "1000", "30 July", "Hi"),
  Transaction("Ajar", "1234", "Hassan", "3456", "55000", "30 July", "Hi"),
  Transaction("Hamza", "1234", "Ajar", "3456", "450", "30 July", "Hi"),
];
final List<Transaction> debittransactions = [
  Transaction("debit", "1234", "Ajar", "3456", "550", "30 July", "Hi"),
  Transaction("test", "1234", "Ajar", "3456", "1000", "30 July", "Hi"),
  Transaction("random", "1234", "Hassan", "3456", "55000", "30 July", "Hi"),
];
