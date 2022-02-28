import 'models/transaction.dart';

List<Transaction> transactions = [
  Transaction(
    type: "Cr",
    date: DateTime.utc(2021, DateTime.august, 9),
    company: "Amazon",
    amount: -159.00,
    icon: 'assets/images/amazon_icon.svg',
    paymentMode: 'Debit Card',
  ),
  Transaction(
    type: "Cr",
    date: DateTime.utc(2021, DateTime.august, 12),
    company: "Apple Inc.",
    amount: -2000.00,
    icon: 'assets/images/apple_icon.svg',
    paymentMode: 'Paid with PhonePe',
  ),
  Transaction(
    type: "Cr",
    date: DateTime.utc(2021, DateTime.september, 1),
    company: "Netflix",
    amount: -200.00,
    icon: 'assets/images/netflix_icon.svg',
    paymentMode: 'Online Banking',
  ),
  Transaction(
    type: "Dr",
    date: DateTime.utc(2021, DateTime.october, 5),
    company: "Citibank",
    amount: 1013.99,
    icon: 'assets/images/citi_bank_icon.svg',
    paymentMode: 'Auto Debit',
  ),
];
