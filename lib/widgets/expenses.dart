import 'package:expense_tracker/widgets/expenses_list/expenses_list.dart';
import 'package:expense_tracker/models/expense_model.dart';
import 'package:expense_tracker/widgets/new_expense.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  final List<ExpenseModel> _initialExpense = [
    ExpenseModel(
        amount: 35.09,
        date: DateTime.now(),
        title: "Briyani",
        category: Categories.food),
    ExpenseModel(
        amount: 30.45,
        date: DateTime.now(),
        title: "Cinema",
        category: Categories.personal),
    ExpenseModel(
        amount: 58.09,
        date: DateTime.now(),
        title: "Work",
        category: Categories.work),
  ];

  void _handleOpenAddExpenseModal() {
    showModalBottomSheet(
      context: context,
      builder: (context) => const NewExpense(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Expense Tracker",
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        backgroundColor: Colors.brown,
        actions: [
          IconButton(
            onPressed: _handleOpenAddExpenseModal,
            style: IconButton.styleFrom(foregroundColor: Colors.white),
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: Column(
        children: [
          const Text("Chart here"),
          Expanded(
            child: ExpensesList(expensesList: _initialExpense),
          ),
        ],
      ),
    );
  }
}
