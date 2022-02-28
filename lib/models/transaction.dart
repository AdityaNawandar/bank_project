import 'package:flutter/material.dart';

class Transaction {
  final String type;
  final DateTime date;
  final String company;
  final double amount;
  final String? icon;
  final String paymentMode;

  Transaction(
      {required this.type,
      required this.date,
      required this.company,
      required this.amount,
      this.icon,
      required this.paymentMode});
}
