import 'package:envelope_budget_app/features/income/data/model/income.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class IncomeGridUI extends StatelessWidget {
  const IncomeGridUI({Key? key, required this.income}) : super(key: key);

  final Income income;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: FaIcon(
                  mapOfIconsToIncomeTypes[income.incomeType],
                size: 50,
              ),
            ),
            Text(
              "${income.balance}",
              style: Theme.of(context).textTheme.headline6,
            ),
            Text(
              income.label,
              style: GoogleFonts.averageSans(
                  fontSize: 19
              ),
            )
          ],
        ),
      ),
    );
  }
}
