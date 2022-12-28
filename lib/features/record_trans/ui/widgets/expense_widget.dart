import 'package:flutter/material.dart';

class ExpenseWidget extends StatefulWidget {
  const ExpenseWidget({Key? key}) : super(key: key);

  @override
  State<ExpenseWidget> createState() => _ExpenseWidgetState();
}

class _ExpenseWidgetState extends State<ExpenseWidget> {
  var listOfBudgets = <String>["Budget 1","Budget 2", "Budget 3"];
  var listOfAccounts = <String>["Account 1","Acct 2", "Acct 3"];
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
      child: Column(
        children: [
          TextField(
            maxLines: 1,
            decoration: InputDecoration(
              labelText: "AMOUNT",
              hintText: "0.0"
            ),
            keyboardType: TextInputType.numberWithOptions(decimal: true),
          ),
          TextField(
            maxLines: 5,
            decoration: InputDecoration(
                labelText: "ADD NOTES"
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              DropdownButton<String>(
                  items: listOfAccounts.map((account){
                    return DropdownMenuItem<String>(
                      child: Text(account),
                      value: account
                    );
                  }).toList(),
                  onChanged: (selectedVal){

                  },
                hint: Text("ACCOUNT"),
              ),
              DropdownButton<String>(
                  items: listOfAccounts.map((account){
                    return DropdownMenuItem<String>(
                        child: Text(account),
                        value: account
                    );
                  }).toList(),
                  onChanged: (selectedVal){

                  },
                hint: Text("BUDGET"),
              ),
            ],
          ),
          Center(
            child: ElevatedButton(
              onPressed: () {  },
              child: Text("SAVE"),
            ),
          )
        ],
      ),
    );
  }
}
