import 'package:envelope_budget_app/features/budgets/ui/widgets/close_modal.dart';
import 'package:envelope_budget_app/features/income/ui/widgets/accounts_dropdown.dart';
import 'package:envelope_budget_app/utils/helpers_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

import '../../../../utils/error_text_widget.dart';
import '../bloc/budget_bloc.dart';

class AddBudget extends StatefulWidget {
  const AddBudget({Key? key}) : super(key: key);

  @override
  State<AddBudget> createState() => _AddBudgetState();
}

class _AddBudgetState extends State<AddBudget> {
  var _label = '';
  var _amount = 0.0;
  DateTime _deadline = DateTime.now();
  var _errorMsg = '';

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 30, 10,
          getBottomPaddingForKeyboardToShow(
              MediaQuery.of(context).viewInsets.bottom)),
      child: ListView(
        shrinkWrap: true,
        children: [
          ErrorTextWidget(errorMsg: _errorMsg),
          TextField(
            maxLines: 2,
            onChanged: (newLabel){
              setState(()=>_label=newLabel);
            },
            decoration: InputDecoration(
                labelText: "LABEL",
                border: OutlineInputBorder()
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top:10.0),
            child: TextField(
              maxLines: 1,
              onChanged: (newAmount){
                setState(()=>_amount = double.tryParse(newAmount) ?? 0.0);
              },
              decoration: InputDecoration(
                  labelText: "AMOUNT",
                  hintText: "0.0",
                  border: OutlineInputBorder()
              ),
              keyboardType: TextInputType.numberWithOptions(decimal: true),
            ),
          ),
          MaterialButton(
            onPressed: (){
              showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime.now(),
                  lastDate: DateTime(2100)
              ).then((value){
                setState((){
                  _deadline = value ?? DateTime.now();
                });
              });
            },
            child: Text(
              _deadline.isBefore(DateTime.now())
                  ? "SELECT DATE"
                  : DateFormat('E, MMM dd y').format(_deadline)
            ),
          ),
          const AccountsDropdown(),
          ElevatedButton(
            onPressed: (){
              //validate inputs with appropriete reponse
              if(_areInputsValid()){
                //pass value to bloc for saving
                context.read<BudgetBloc>()
                    .saveBudget(label: _label, amount: _amount, deadline: _deadline);
                // and close modal when saved
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("$_label Added Successfully"))
                );
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
    if(_amount <= 0){
      setState(() {
        _errorMsg = "Enter a valid amount";
      });
      return false;
    }else if(_label.length < 2){
      setState(() {
        _errorMsg = "Enter a valid label for identifying this budget";
      });
      return false;
    }else if(_deadline.isBefore(DateTime.now()) ?? true){
      setState(() {
        _errorMsg = "Enter a valid deadline date";
      });
      return false;
    }
    return true;
  }
}