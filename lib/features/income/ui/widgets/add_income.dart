import 'package:envelope_budget_app/features/income/data/model/income.dart';
import 'package:envelope_budget_app/features/income/ui/bloc/income_bloc.dart';
import 'package:envelope_budget_app/utils/error_text_widget.dart';
import 'package:envelope_budget_app/utils/helpers_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AddIncome extends StatefulWidget {
  const AddIncome({Key? key}) : super(key: key);

  @override
  State<AddIncome> createState() => _AddIncomeState();
}

class _AddIncomeState extends State<AddIncome> {
  var _note = '';
  var _balance = 0.0;
  IncomeType _incomeType = IncomeType.others;
  final List<IncomeType> _incomeTypes = IncomeType.values;//.map((e) => e.name).toList();
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
          Text(
            "RECORD INCOME",
            style: Theme.of(context).textTheme.headline5,
          ),
          ErrorTextWidget(errorMsg: _errorMsg),
          Padding(
            padding: const EdgeInsets.only(bottom:10.0),
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
          TextField(
            maxLines: 2,
            onChanged: (newLabel){
              setState(()=>_note=newLabel);
            },
            decoration: const InputDecoration(
                labelText: "NOTE",
                border: OutlineInputBorder()
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Income Source",
                style: Theme.of(context).textTheme.headline6?.copyWith(
                  fontSize: 18
                ),
              ),
              Center(
                child: DropdownButton<IncomeType>(
                  value: _incomeType,
                  borderRadius: BorderRadius.circular(5),
                  items: _incomeTypes.map((incomeTypeItem){
                    return DropdownMenuItem(
                        value: incomeTypeItem,
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: FaIcon(
                                  mapOfIconsToIncomeTypes[incomeTypeItem]
                              ),
                            ),
                            Text(incomeTypeItem.name.replaceAll("_", " ").toUpperCase())
                          ],
                        )
                    );
                  }).toList(),
                  onChanged: (newIncomeType){
                    setState(() {
                      _incomeType = newIncomeType ?? IncomeType.others;
                    });
                  },
                ),
              ),
            ],
          ),
          ElevatedButton(
            onPressed: (){
              //validate inputs with appropriete reponse
              if(_areInputsValid()){
                //pass value to bloc for saving
                context.read<IncomeBloc>()
                    .saveIncome(label: _note, balance: _balance, incomeType: _incomeType);
                // and close modal when saved
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("$_note Added Successfully"))
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
    if(_balance <= 0){
      setState(() {
        _errorMsg = "Enter a valid balance";
      });
      return false;
    }else if(_note.length < 2){
      setState(() {
        _errorMsg = "Enter a note (can be bank name, wallet provider) for this income";
      });
      return false;
    }
    return true;
  }
}
