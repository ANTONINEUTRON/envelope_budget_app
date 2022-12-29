import 'package:envelope_budget_app/features/budgets/ui/widgets/close_modal.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AddBudget extends StatelessWidget {
  const AddBudget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 3, 10, 5),
      child: ListView(
        shrinkWrap: true,
        children: [
          // CloseModal(),
          TextField(
            maxLines: 2,
            decoration: InputDecoration(
                labelText: "LABEL",
              border: OutlineInputBorder()
            ),
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
          MaterialButton(
              onPressed: (){},
            child: Text("SELECT DATE"),
          ),
          ElevatedButton(
            onPressed: (){},
            child:  Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FaIcon(
                    FontAwesomeIcons.save
                ),
                Padding(
                  padding: const EdgeInsets.only(left:5.0),
                  child: Text("SAVE"),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
