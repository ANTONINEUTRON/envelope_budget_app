import 'package:envelope_budget_app/features/budgets/ui/widgets/close_modal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../utils/error_text_widget.dart';
import '../bloc/budget_bloc.dart';

class AddBudget extends StatefulWidget {
  const AddBudget({Key? key}) : super(key: key);

  @override
  State<AddBudget> createState() => _AddBudgetState();
}

class _AddBudgetState extends State<AddBudget> {
  var label = '';
  var amount = 0.0;
  DateTime deadline = DateTime.now();
  var errorMsg = '';

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(10, 3, 10, 5),
      child: ListView(
        shrinkWrap: true,
        children: [
          ErrorTextWidget(errorMsg: errorMsg),
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
            onPressed: (){
              //validate inputs with appropriete reponse
              if(_areInputsValid()){
                //pass value to bloc for saving
                context.read<BudgetBloc>()
                    .saveBudget(label: label, amount: amount, deadline: deadline);
                // and close modal when saved
                Navigator.pop(context);
              }
            },
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

  bool _areInputsValid() {
    if(amount <= 0){
      setState(() {
        errorMsg = "Enter a valid amount";
      });
      return false;
    }else if(label.length < 2){
      setState(() {
        errorMsg = "Enter a valid label for identifying this budget";
      });
      return false;
    }else if(deadline?.isBefore(DateTime.now()) ?? true){
      setState(() {
        errorMsg = "Enter a valid deadline date";
      });
      return false;
    }
    return true;
  }
}