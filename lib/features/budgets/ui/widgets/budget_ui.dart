import 'package:envelope_budget_app/features/budgets/data/model/budget.dart';
import 'package:envelope_budget_app/utils/helpers_functions.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';


class BudgetUI extends StatelessWidget {
  const BudgetUI({Key? key, this.onTap, required this.budget}) : super(key: key);
  final Function()? onTap;
  final Budget budget;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.translucent,
      child: Container(
        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const FaIcon(
                    FontAwesomeIcons.solidEnvelope
                ),
                Container(padding: const EdgeInsets.all(6),),
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        budget.label,
                        style: GoogleFonts.dmSans(
                            textStyle: Theme.of(context).textTheme.bodyLarge,
                            fontSize: 16,
                            fontWeight: FontWeight.bold
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                  "Amount: NGN ${budget.amount}",
                                style: GoogleFonts.alumniSans(
                                  fontSize: 19
                                ),
                              ),
                              // Text(
                              //     "Spent: ${budget.getAmountSpent()}"
                              // ),
                              Text(
                                  "Remaining: NGN ${budget.getRemsAmount()}",
                                style: GoogleFonts.alumniSans(
                                    fontSize: 18
                                ),
                              )
                            ],
                          ),
                          Text(
                            formatDate(budget.deadline),
                            style: GoogleFonts.acme(),
                          )
                        ],
                      ),
                      // Slider(
                      //   value: budget.getAmountSpent(),
                      //   onChanged: (newValue){},
                      //   label: "Remaining",
                      //   max: budget.amount,
                      //   min: 0,
                      // ),
                      SizedBox(height: 10,),
                      LinearProgressIndicator(
                        minHeight: 10,
                        value: budget.getAmountSpent()/budget.amount,
                      ),
                      Center(
                          child: Text(
                              "NGN ${budget.getAmountSpent()}",
                            style: GoogleFonts.alumniSans(
                                fontSize: 19
                            ),
                          )
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

}
