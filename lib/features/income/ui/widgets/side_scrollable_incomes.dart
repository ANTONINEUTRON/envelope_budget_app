import 'package:envelope_budget_app/features/income/data/model/income.dart';
import 'package:envelope_budget_app/features/income/ui/bloc/income_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'income_grid_ui.dart';


class SideScrollableIncomes extends StatefulWidget {
  const SideScrollableIncomes({Key? key}) : super(key: key);

  @override
  State<SideScrollableIncomes> createState() => _SideScrollableIncomesState();
}

class _SideScrollableIncomesState extends State<SideScrollableIncomes> {


  @override
  Widget build(BuildContext context) {
    List<Income> _incomes = context.watch<IncomeBloc>().state;

    double height = 150;
    return ListView(
      scrollDirection: Axis.horizontal,
      children: [
        SizedBox(
          height: height,
          width: height,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: _incomes.length,
            itemBuilder: (context, index){
              var income = _incomes[index];

              return IncomeGridUI(income: income,);
            },
          ),
        ),

      ],
    );
  }
}
