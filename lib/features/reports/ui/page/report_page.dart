import 'package:envelope_budget_app/features/budgets/data/model/expense.dart';
import 'package:envelope_budget_app/features/budgets/ui/bloc/budget_bloc.dart';
import 'package:envelope_budget_app/features/budgets/ui/widgets/expense_ui.dart';
import 'package:envelope_budget_app/features/income/ui/widgets/side_scrollable_incomes.dart';
import 'package:envelope_budget_app/features/reports/ui/widgets/grid_summary_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';


class ReportPage extends StatefulWidget {
  const ReportPage({Key? key}) : super(key: key);

  @override
  State<ReportPage> createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {
  @override
  Widget build(BuildContext context) {

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
        return CustomScrollView(
          physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics()
          ),
          slivers: [
            SliverAppBar(
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Total balance"),
                  Text("#2000")
                ],
              ),
              expandedHeight: 120,
              stretch: true,
              flexibleSpace: FlexibleSpaceBar(
                stretchModes: const [
                  StretchMode.zoomBackground,
                  StretchMode.blurBackground,
                  StretchMode.fadeTitle,
                ],
                background: Stack(
                  fit: StackFit.expand,
                  children: <Widget>[
                    Container(
                        padding: EdgeInsets.fromLTRB(5, 100, 5, 20),
                        height: 100,
                        child: SideScrollableIncomes()
                    ),
                    DecoratedBox(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment(0.0, 0.5),
                          end: Alignment.center,
                          colors: <Color>[
                            Color(0x60000000),
                            Color(0x00000000),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 0,
                  mainAxisSpacing: 0,
                  mainAxisExtent: 140
              ),
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return const GridSummaryUI(
                    label: 'Expense',
                    fAI: FontAwesomeIcons.moneyBillWave,
                    amount: '2500000',
                  );
                },
                childCount: 4,
              ),
            ),

            SliverToBoxAdapter(
              child: Container(
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
            ),

            SliverList(
                delegate: SliverChildBuilderDelegate(
                  childCount: listOfExpenses.length > 5 ? 5 : listOfExpenses.length,
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
}
