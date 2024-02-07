import 'package:expense_tracker/models/expense_model.dart';
import 'package:expense_tracker/widgets/expenses_list/expense_card.dart';
import 'package:flutter/material.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList(
      {super.key, required this.expensesList, required this.onRemoveExpense});

  final List<ExpenseModel> expensesList;
  final void Function(ExpenseModel expense) onRemoveExpense;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expensesList.length,
      itemBuilder: (context, index) => Dismissible(
        onDismissed: (dir) {
          onRemoveExpense(expensesList[index]);
        },
        key: ValueKey(expensesList[index]),
        child: ExpenseCard(expensesList[index]),
      ),
    );
  }
}
