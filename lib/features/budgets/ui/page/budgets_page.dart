import 'package:envelope_budget_app/features/budgets/ui/widgets/budget_detail.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/add_budget.dart';
import '../widgets/budget_ui.dart';

class BudgetsPage extends StatefulWidget {
  const BudgetsPage({Key? key}) : super(key: key);

  @override
  State<BudgetsPage> createState() => _BudgetsPageState();
}

class _BudgetsPageState extends State<BudgetsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Budgets"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          showModalBottomSheet(
              context: context,
              builder: (context){
                return AddBudget();
              }
          );
        },
        child: FaIcon(FontAwesomeIcons.plus),
      ),
      body: ListView.builder(
          itemCount: 10,
          itemBuilder: (context,index){
            return BudgetUI(
              onTap: (){
                showModalBottomSheet(
                    context: context,
                    builder: (context)=>BudgetDetail()
                );
              },
            );
          }
      ),
    );
  }
}
