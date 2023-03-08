
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class BalanceRepository{
  final _BalanceStoreKEY = "CARD_STORE";

  Future<void> addBalance(double newAmount) async{
    var sharedPref = await SharedPreferences.getInstance();
    sharedPref.setDouble(_BalanceStoreKEY, newAmount);
  }

  Future<double> getBalance() async{
    var sp = await SharedPreferences.getInstance();
    return sp.getDouble(_BalanceStoreKEY) ?? 0.0;
  }
}