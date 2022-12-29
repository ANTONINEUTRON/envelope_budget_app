import 'package:envelope_budget_app/features/budgets/ui/widgets/close_modal.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'budget_ui.dart';

class BudgetDetail extends StatefulWidget {
  const BudgetDetail({Key? key}) : super(key: key);

  @override
  State<BudgetDetail> createState() => _BudgetDetailState();
}

class _BudgetDetailState extends State<BudgetDetail> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(15, 3, 15, 7),
      child: ListView(
        shrinkWrap: true,
        children: [
          // CloseModal(),
          BudgetUI(),
          ElevatedButton(
            onPressed: (){},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("View Expenses"),
                FaIcon(FontAwesomeIcons.angleRight)
              ],
            ),
          ),

          Text(
              "Record Expenses",
            style: Theme.of(context).textTheme.headline5,
          ),
          TextField(
            maxLines: 1,
            decoration: InputDecoration(
                labelText: "AMOUNT",
                hintText: "0.0",
                border: OutlineInputBorder()
            ),
            keyboardType: TextInputType.numberWithOptions(decimal: true),
          ),
          TextField(
            maxLines: 2,
            decoration: InputDecoration(
                labelText: "ADD NOTES",
                border: OutlineInputBorder()
            ),
          ),
          ElevatedButton(
              onPressed: (){},
              child: Text("SAVE")
          )
        ],
      ),
    );
  }
}
