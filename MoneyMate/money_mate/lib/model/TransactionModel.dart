import '../ImportAll.dart';

class TransactionModel {
  String? transactionType;
  String? date;
  DateTime? dateTime;
  String? category;
  double? amount;

  TransactionModel({
    this.transactionType,
    this.date,
    this.dateTime,
    this.category,
    this.amount,
  });

  factory TransactionModel.fromFirestore(Map<String, dynamic> json) {
    return TransactionModel(
      transactionType: json['Transaction_type'],
      date: json['date'],
      dateTime: (json['dateTime'] as Timestamp).toDate(),
      category: json['Category'],
      amount: json['Amount'].toDouble(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'transactionType': transactionType,
      'date': date,
      'dateTime': dateTime,
      'category': category,
      'amount': amount,
    };
  }
}
