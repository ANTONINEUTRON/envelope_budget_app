import 'package:envelope_budget_app/utils/helpers_functions.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:envelope_budget_app/features/budgets/data/model/expense.dart';

class ExpenseUI extends StatelessWidget {
  const ExpenseUI({Key? key, required this.expense}) : super(key: key);

  final Expense expense;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(top:1, right: 8, left: 8),
        child: Card(
            child: Container(
                padding: EdgeInsets.all(8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const FaIcon(FontAwesomeIcons.moneyBill1Wave),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.only(left: 5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              expense.label,
                              style: GoogleFonts.dmSans(
                                  textStyle: Theme.of(context).textTheme.bodyLarge,
                                  fontSize: 17
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(
                                    child: Text(
                                        "${expense.amount}"
                                    )
                                ),
                                Flexible(
                                  child: Text(
                                      formatDate(expense.id),
                                      style: GoogleFonts.acme()
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                )
            )
        )
    );
  }
}
