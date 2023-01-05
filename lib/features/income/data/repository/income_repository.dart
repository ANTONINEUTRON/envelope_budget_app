
import 'dart:convert';

import 'package:envelope_budget_app/features/income/data/model/income.dart';
import 'package:shared_preferences/shared_preferences.dart';

class IncomeRepository {
  // IncomeRepository(){
  //   SharedPreferences.getInstance().then((value) => _sharedPref = value);
  // }
  //
  // late SharedPreferences _sharedPref;
  final IncomesKey = "Income_KEY";

  Future<List<Income>> getAllIncomes() async{
    var _sharedPref = await SharedPreferences.getInstance();
    //get llist of Income
    List<String> listOfAcctStrings = await _sharedPref.getStringList(IncomesKey) ?? [];
    //decode
    //pass to fromJson
    //return list
    return listOfAcctStrings.map((e){
      return Income.fromJson(jsonDecode(e));
    }).toList();
  }

  Future<bool> recordIncome({required Income income}) async {
    //get list of incomes
    var incomes = await getAllIncomes();
    //add income
    incomes.add(income);
    //encode to json
    var pref = await SharedPreferences.getInstance();
    //save to sharedpref
    return pref.setStringList(IncomesKey, _encodeIncomeToListOfString(incomes));
  }

  List<String> _encodeIncomeToListOfString(List<Income> incomes) {
    return incomes.map((income){
      return jsonEncode(income.toJson());
    }).toList();
  }

}