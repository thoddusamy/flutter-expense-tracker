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
      isScrollControlled: true,
      builder: (context) => NewExpense(onAddNewExpense: addNewExpense),
    );
  }

  void addNewExpense(ExpenseModel expense) {
    setState(() {
      _initialExpense.add(expense);
    });
  }

  void _removeExpense(ExpenseModel expense) {
    final expenseIndex = _initialExpense.indexOf(expense);
    setState(() {
      _initialExpense.remove(expense);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text("Expense removed"),
        duration: const Duration(seconds: 2),
        action: SnackBarAction(
            label: 'Undo',
            onPressed: () {
              setState(() {
                _initialExpense.insert(expenseIndex, expense);
              });
            }),
      ),
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
          const SizedBox(height: 15),
          Expanded(
              child: _initialExpense.isNotEmpty
                  ? ExpensesList(
                      expensesList: _initialExpense,
                      onRemoveExpense: _removeExpense,
                    )
                  : const Center(
                      child: Text("No Expense found. Try to add new..."),
                    )),
        ],
      ),
    );
  }
}
