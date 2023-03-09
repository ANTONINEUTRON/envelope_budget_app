import 'package:envelope_budget_app/features/budgets/data/model/expense.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import '../../data/model/budget.dart';
import '../widgets/expense_ui.dart';

class ExpensePage extends StatelessWidget {
  const ExpensePage({Key? key, required this.budget}) : super(key: key);

  final Budget budget;

  static Route route({required Budget budget}) =>
      MaterialPageRoute(builder: (context)=>ExpensePage(budget: budget));

  @override
  Widget build(BuildContext context) {
    var expenses = budget.expenses;
    var title = budget.label;
    var amount = budget.amount;

    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(
          parent: AlwaysScrollableScrollPhysics()
        ),
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: true,
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title),
                Text("NGN ${amount}")
              ],
            ),
            expandedHeight: 350,
            stretch: true,
            flexibleSpace: FlexibleSpaceBar(
              stretchModes: [
                StretchMode.zoomBackground,
                StretchMode.blurBackground,
                StretchMode.fadeTitle,
              ],
              background: Stack(
                fit: StackFit.expand,
                children: <Widget>[
                  PieChart(
                    dataMap: {for(var expense in expenses) expense.label : expense.amount},
                    animationDuration: Duration(milliseconds: 500),

                  ),
                  // DecoratedBox(
                  //   decoration: BoxDecoration(
                  //     gradient: LinearGradient(
                  //       begin: Alignment(0.0, 0.5),
                  //       end: Alignment.center,
                  //       colors: <Color>[
                  //         Color(0x60000000),
                  //         Color(0x00000000),
                  //       ],
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ),
          ),

          SliverList(
              delegate: SliverChildBuilderDelegate(
                childCount: expenses.length,
                (context, index){
                  return ExpenseUI(expense: expenses[index],);
                }
              )
          )
        ],
      ),
    );
  }
}
