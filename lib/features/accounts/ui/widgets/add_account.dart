import 'package:envelope_budget_app/utils/error_text_widget.dart';
import 'package:envelope_budget_app/utils/helpers_functions.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../bloc/account_bloc.dart';

class AddAccount extends StatefulWidget {
  const AddAccount({Key? key}) : super(key: key);

  @override
  State<AddAccount> createState() => _AddAccountState();
}

class _AddAccountState extends State<AddAccount> {
  var _label = '';
  var _balance = 0.0;
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
                setState(()=>_balance = double.tryParse(newAmount) ?? 0.0);
              },
              decoration: InputDecoration(
                  labelText: "AMOUNT",
                  hintText: "0.0",
                  border: OutlineInputBorder()
              ),
              keyboardType: TextInputType.numberWithOptions(decimal: true),
            ),
          ),
          ElevatedButton(
            onPressed: (){
              //validate inputs with appropriete reponse
              if(_areInputsValid()){
                // //pass value to bloc for saving
                // context.read<AccountBloc>()
                //     .saveAccount(label: _label, amount: _balance, deadline: _deadline);
                // // and close modal when saved
                // Navigator.pop(context);
                // ScaffoldMessenger.of(context).showSnackBar(
                //     SnackBar(content: Text("$_label Added Successfully"))
                // );
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
    if(_balance <= 0){
      setState(() {
        _errorMsg = "Enter a valid balance";
      });
      return false;
    }else if(_label.length < 2){
      setState(() {
        _errorMsg = "Enter a valid label for identifying this budget";
      });
      return false;
    }
    return true;
  }
}
