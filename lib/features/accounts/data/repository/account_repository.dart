
import 'dart:convert';

import 'package:envelope_budget_app/features/accounts/data/model/account.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AccountRepository {
  // AccountRepository(){
  //   SharedPreferences.getInstance().then((value) => _sharedPref = value);
  // }
  //
  // late SharedPreferences _sharedPref;
  final accountsKey = "ACCOUNT_KEY";

  Future<List<Account>> getAllAccounts() async{
    var _sharedPref = await SharedPreferences.getInstance();
    //get llist of account
    List<String> listOfAcctStrings = await _sharedPref.getStringList(accountsKey) ?? [];
    //decode
    //pass to fromJson
    //return list
    return listOfAcctStrings.map((e){
      return Account.fromJson(jsonDecode(e));
    }).toList();
  }

}