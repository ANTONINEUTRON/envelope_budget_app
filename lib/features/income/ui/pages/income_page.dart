
import 'package:envelope_budget_app/features/income/data/model/income.dart';
import 'package:envelope_budget_app/features/income/ui/bloc/income_bloc.dart';
import 'package:envelope_budget_app/features/income/ui/widgets/income_grid_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../widgets/add_income.dart';


class IncomePage extends StatefulWidget {
  const IncomePage({Key? key}) : super(key: key);

  @override
  State<IncomePage> createState() => _IncomePageState();
}

class _IncomePageState extends State<IncomePage> {
  @override
  Widget build(BuildContext context) {
    List<Income> incomes = context.watch<IncomeBloc>().state;
    return Scaffold(
      appBar: AppBar(
        title: Text("Incomes"),
      ),
      body: GridView(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          mainAxisExtent: 150
        ),
        children: [
          for(var income in incomes) IncomeGridUI(income: income),
          SizedBox(
              height: 150,
              width: 150,
              child: GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: (){
                  showModalBottomSheet(
                      context: context,
                      builder: (context){
                        return AddIncome();
                      }
                  );
                },
                child: const Card(
                  child: Center(
                    child: FaIcon(
                      FontAwesomeIcons.plus,
                      size: 100,
                      color: Colors.lightBlue,
                    ),
                  ),
                ),
              )
          )
        ],
      ),
    );
  }
}
