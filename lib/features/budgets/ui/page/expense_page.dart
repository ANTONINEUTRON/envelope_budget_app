import 'package:envelope_budget_app/features/budgets/data/model/expense.dart';
import 'package:flutter/material.dart';

class ExpensePage extends StatelessWidget {
  const ExpensePage({Key? key, required this.expenses}) : super(key: key);

  final List<Expense> expenses;

  static Route route(expenses) => MaterialPageRoute(builder: (context)=>ExpensePage(expenses: expenses));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Expenses"),
      ),
      body: ListView.builder(
        itemCount: expenses.length,
          itemBuilder: (context, index){
            return ListTile(title: Text("$index"),);
          }
      ),
    );
  }
}
