import 'package:expense_tracker/models/expense_model.dart';
import 'package:flutter/material.dart';

class ExpenseCard extends StatelessWidget {
  const ExpenseCard(this.singleExpense, {super.key});

  final ExpenseModel singleExpense;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(singleExpense.title),
            const SizedBox(height: 5),
            Row(
              children: [
                Text('\$${singleExpense.amount.toStringAsFixed(2)}'),
                const Spacer(),
                Row(
                  children: [
                    Icon(categoryIcons[singleExpense.category]),
                    const SizedBox(width: 15),
                    Text(singleExpense.getFormattedDate)
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
