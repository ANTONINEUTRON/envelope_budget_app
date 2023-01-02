import 'package:envelope_budget_app/features/budgets/data/model/budget.dart';
import 'package:envelope_budget_app/features/budgets/ui/bloc/budget_bloc.dart';
import 'package:envelope_budget_app/features/budgets/ui/widgets/budget_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
    var budgetBloc = context.watch<BudgetBloc>();

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
      body: FutureBuilder(
        future: budgetBloc.getAllBudgets(),
        builder: (context, snapshot) {
          if(!snapshot.hasData){
            return const Center(child: CircularProgressIndicator());
          }
          List<Budget> listOfBudget = snapshot.data as List<Budget>;
          if(listOfBudget.isEmpty){
            return Center(
              child: Text("Budget has not been added yet!"),
            );
          }
          return ListView.builder(
              itemCount: listOfBudget.length,
              itemBuilder: (context,index){
                return Column(
                  children: [
                    BudgetUI(
                      budget: listOfBudget[index],
                      onTap: (){
                        showModalBottomSheet(
                            context: context,
                            builder: (context)=>BudgetDetail(budget: listOfBudget[index])
                        );
                      },
                    )
                  ],
                );
              }
          );
        }
      ),
    );
  }
}
