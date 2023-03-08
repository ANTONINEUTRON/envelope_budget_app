import 'package:envelope_budget_app/features/income/data/model/income.dart';
import 'package:envelope_budget_app/features/income/ui/bloc/income_bloc.dart';
import 'package:envelope_budget_app/features/income/ui/widgets/billing_details.dart';
import 'package:envelope_budget_app/utils/error_text_widget.dart';
import 'package:envelope_budget_app/utils/helpers_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../data/model/card.dart';

class AddIncome extends StatefulWidget {
  const AddIncome({Key? key}) : super(key: key);

  @override
  State<AddIncome> createState() => _AddIncomeState();
}

class _AddIncomeState extends State<AddIncome> {
  var _note = '';
  var _balance = 0.0;
  CardProvider? _incomeType;
  final List<CardProvider> _incomeTypes = CardProvider.values;//.map((e) => e.name).toList();
  var _errorMsg = '';

  var _cardNumber = '';
  var _cardOwnerName = '';
  var _cardCVV = '';
  var _cardExpiryDate = '';
  var _cardProvider = '';
  var _amount = 0.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 10, 10,
          getBottomPaddingForKeyboardToShow(
              MediaQuery.of(context).viewInsets.bottom)),
      child: ListView(
        shrinkWrap: true,
        children: [
          Text(
            "Fund Wallet",
            style: Theme.of(context).textTheme.headline5,
          ),
          ErrorTextWidget(errorMsg: _errorMsg),
          DropdownButton<CardProvider>(
            value: _incomeType,
            hint: Text("Card Provider"),
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
                _incomeType = newIncomeType;
                _cardProvider = newIncomeType.toString();
              });
            },
          ),
          Padding(
            padding: const EdgeInsets.only(bottom:10.0),
            child: TextField(
              onChanged: (newValue){
                setState(()=>_cardNumber = newValue);
              },
              decoration: InputDecoration(
                  labelText: "Card Number",
                  border: OutlineInputBorder()
              ),
              keyboardType: TextInputType.numberWithOptions(decimal: true),
            ),
          ),
          TextField(
            onChanged: (newValue){
              setState(()=>_cardOwnerName = newValue);
            },
            decoration: const InputDecoration(
                labelText: "Card Owner Name",
                border: OutlineInputBorder()
            ),
          ),
          const SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.3,
                child: TextField(
                  maxLength: 3,
                  onChanged: (newValue){
                    setState(()=>_cardCVV = newValue);
                  },
                  decoration: const InputDecoration(
                      labelText: "Card CVV",
                      hintText: "000",
                      border: OutlineInputBorder()
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.3,
                child: TextField(
                  onChanged: (newValue){
                    setState(()=>_cardExpiryDate = newValue);
                  },
                  maxLength: 5,
                  decoration: const InputDecoration(
                      labelText: "Expiry Date",
                      hintText: "00/00",
                      border: OutlineInputBorder()
                  ),
                ),
              ),
            ],
          ),
          ElevatedButton(
            onPressed: (){
              //validate inputs with appropriete reponse
              if(_areInputsValid()){
                Navigator.pop(context);
                //show alert
                showDialog(
                    context: context,
                    builder: (context){
                      return AlertDialog(
                        title: Text("Billing Details"),
                        content: BillingDetails(
                          card: CCard(
                            cvv: _cardCVV,
                            expiryDate: _cardExpiryDate,
                            name: _cardOwnerName,
                            number: _cardNumber,
                            provider: _cardProvider
                          )
                        ),
                      );
                    }
                );
                //pass value to bloc for saving
                // context.read<IncomeBloc>()
                //     .saveIncome(
                //     label: _note,
                //     balance: _balance,
                //     incomeType: _incomeType ?? CardProvider.others
                // );
                // and close modal when saved
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("$_note Added Successfully"))
                );
              }
            },
            child:  Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                FaIcon(
                    FontAwesomeIcons.save
                ),
                Padding(
                  padding: EdgeInsets.only(left:5.0),
                  child: Text("SAVE"),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  var expiryRE = RegExp(r"/\b(0[1-9]|1[0-2])\/?([0-9]{4}|[0-9]{2})\b/");
  var cvvRE = RegExp(r'/^[0-9]{3,4}$/');
  bool _areInputsValid() {
    // if(_balance <= 0){
    //   setState(() {
    //     _errorMsg = "Enter a valid balance";
    //   });
    //   return false;
    // }else if(_note.length < 2){
    //   setState(() {
    //     _errorMsg = "Enter a note (can be bank name, wallet provider) for this income";
    //   });
    //   return false;
    // }
    if(_cardNumber.length < 11){
      return setErrorMsg("Please provide a valid credit card number");
    }else if(_cardExpiryDate[2] != '/'){
      print(_cardExpiryDate);
      return setErrorMsg("Please provide a valid expiry date on your card");
    }else if(_cardOwnerName.length < 4){
      return setErrorMsg("Please provide a valid name associated with the credit card");
    }else if(_cardCVV.length < 3){
      return setErrorMsg("Please provide a valid CVV");
    }else if(_cardProvider.isEmpty){
      return setErrorMsg("You need to select a card provider");
    }
    return true;
  }

  bool setErrorMsg(String msg) {
    setState(() {
      _errorMsg = msg;
    });
    Future.delayed(Duration(seconds: 30),() {
      setState(() {
        _errorMsg = '';
      });
    },);
    return false;
  }

  String truncatedCardNum() => _cardNumber.replaceRange(4, _cardNumber.length-4, "******");
}
