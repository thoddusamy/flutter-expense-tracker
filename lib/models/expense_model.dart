import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

enum Categories { food, work, travel, personal }

final dateFormatter = DateFormat.yMd();

const uuid = Uuid();

const categoryIcons = {
  Categories.food: Icons.dining,
  Categories.work: Icons.work,
  Categories.travel: Icons.airplane_ticket,
  Categories.personal: Icons.person,
};

class ExpenseModel {
  ExpenseModel(
      {required this.amount,
      required this.date,
      required this.title,
      required this.category})
      : id = uuid.v4();

  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Categories category;

  String get getFormattedDate {
    return dateFormatter.format(date);
  }
}
