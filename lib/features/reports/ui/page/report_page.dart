import 'package:envelope_budget_app/features/budgets/data/model/expense.dart';
import 'package:envelope_budget_app/features/budgets/ui/bloc/budget_bloc.dart';
import 'package:envelope_budget_app/features/budgets/ui/widgets/expense_ui.dart';
import 'package:envelope_budget_app/features/home/ui/bloc/balance_bloc.dart';
import 'package:envelope_budget_app/features/income/ui/widgets/side_scrollable_incomes.dart';
import 'package:envelope_budget_app/features/reports/ui/widgets/grid_summary_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../budgets/data/model/budget.dart';
import '../../../income/ui/widgets/add_income.dart';


class ReportPage extends StatefulWidget {
  const ReportPage({Key? key}) : super(key: key);

  @override
  State<ReportPage> createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {
  double _balance = 0.0;
  double _expenses = 0.0;
  double _amountBudgeted = 0.0;

  @override
  Widget build(BuildContext context) {
    _balance = context.watch<BalanceBloc>().state;
    List<Budget> _budgets = context.watch<BudgetBloc>().state;
    _calculateBudgetValues(_budgets);

    return FutureBuilder(
      future: context.watch<BudgetBloc>().getAllExpenses(),
      builder: (context, snapshot) {
        if(!snapshot.hasData){
          return const Center(child: CircularProgressIndicator());
        }
        var listOfExpenses = snapshot.data as List<Expense>;
        listOfExpenses.sort((a, b) {
          return a.id.compareTo(b.id);
        },);

        listOfExpenses = listOfExpenses.reversed.toList();

        return CustomScrollView(
          physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics()
          ),
          slivers: [
            SliverAppBar(
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Center(
                  //   child: Text("APP NAME"),
                  // ),
                  Text(
                    "Balance",
                    style: GoogleFonts.averageSans(
                        textStyle: Theme.of(context).textTheme.headline6?.copyWith(color: Colors.lightBlue.shade200)
                    ),
                  ),
                  Text(
                    "NGN $_balance",
                    style: GoogleFonts.alumniSans(
                        textStyle: Theme.of(context).textTheme.headline6?.copyWith(color: Colors.lightBlue.shade100)
                    ),
                  )
                ],
              ),
              expandedHeight: 80,
              stretch: true,
              actions: [
                IconButton(
                  icon: Icon(Icons.add_circle_outline,size: 30,),
                    onPressed: (){
                      showModalBottomSheet(
                          context: context,
                          builder: (context){
                            return AddIncome();
                          }
                      );
                    },
                  style: IconButton.styleFrom(
                    backgroundColor:  Colors.lightBlue.shade800
                  ),
                    // child: Text("fund wallet"),
                    // style: ElevatedButton.styleFrom(
                    //     backgroundColor: Colors.lightBlue.shade100,
                    //     foregroundColor: Colors.blue.shade900,
                    //     shape: StadiumBorder()
                    // )
                )
              ],
              // flexibleSpace: FlexibleSpaceBar(
              //   stretchModes: const [
              //     StretchMode.zoomBackground,
              //     StretchMode.blurBackground,
              //     StretchMode.fadeTitle,
              //   ],
              //   background:
              //   // Stack(
              //   //   fit: StackFit.expand,
              //   //   children: <Widget>[
              //   //     Container(
              //   //         padding: EdgeInsets.fromLTRB(5, 100, 5, 20),
              //   //         height: 100,
              //   //         child: Row(
              //   //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //   //           children: [
              //   //             // MaterialButton(
              //   //             //     onPressed: (){},
              //   //             //   child: Text("withdraw"),
              //   //             //   color: Colors.white70,
              //   //             // ),
              //   //
              //   //           ]
              //   //         )
              //   //         //child: SideScrollableIncomes()
              //   //     ),
              //   //     DecoratedBox(
              //   //       decoration: BoxDecoration(
              //   //         gradient: LinearGradient(
              //   //           begin: Alignment(0.0, 0.5),
              //   //           end: Alignment.center,
              //   //           colors: <Color>[
              //   //             // Color(0x60000000),
              //   //             Color(0x30000000),
              //   //             Color(0x30000000),
              //   //           ],
              //   //         ),
              //   //       ),
              //   //     ),
              //   //   ],
              //   // ),
              // ),
            ),

            SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 0,
                  mainAxisSpacing: 0,
                  mainAxisExtent: 140
              ),
              delegate: SliverChildListDelegate(
                [
                  GridSummaryUI(
                    label: 'Total Budget',
                    fAI: FontAwesomeIcons.moneyBillWave,
                    amount: 'NGN $_amountBudgeted',
                  ),
                  GridSummaryUI(
                    label: 'Total Expenses',
                    fAI: FontAwesomeIcons.moneyBillWave,
                    amount: 'NGN $_expenses',
                  ),
                ]
              )
            ),

            SliverToBoxAdapter(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    padding: EdgeInsets.fromLTRB(5, 15, 5, 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                            "Recent Transactions",
                          style: GoogleFonts.averageSans(
                            textStyle: Theme.of(context).textTheme.headline6
                          ),
                        ),
                        // Row(
                        //   children: [
                        //     Text(
                        //         "see all",
                        //       style: Theme.of(context).textTheme.bodyMedium,
                        //     ),
                        //     Icon(Icons.chevron_right)
                        //   ],
                        // )
                      ],
                    ),
                  ),
                  listOfExpenses.isEmpty ? Container(
                    padding: EdgeInsets.only(top: 70),
                    child: Text(
                      "No Transaction has been made yet!\n Navigate to the budget section to get started",
                      style: Theme.of(context).textTheme.labelLarge,
                      textAlign: TextAlign.center,
                    ),
                  ) : Container()
                ],
              ),
            ),

            SliverList(
                delegate: SliverChildBuilderDelegate(
                  childCount: listOfExpenses.length > 7 ? 7 : listOfExpenses.length,
                  (context, index){
                    return ExpenseUI(expense: listOfExpenses[index],);
                  }
                )
            )
          ],
        );
      }
    );
  }

  void _calculateBudgetValues(List<Budget> _budgets) {
    for(var budget in _budgets){
      _amountBudgeted += budget.amount;
      for(var expense in budget.expenses){
        _expenses += expense.amount;
      }
    }
  }
}
