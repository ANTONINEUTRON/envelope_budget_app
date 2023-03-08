
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../model/card.dart';

class CardRepository{
  final _CardSttoreKEY = "CARD_STORE";

  Future<void> saveCard(CCard card) async{
    var sharedPref = await SharedPreferences.getInstance();
    sharedPref.setString(_CardSttoreKEY, jsonEncode(card.toJson()));
  }

  Future<CCard> getCard() async{
    var sp = await SharedPreferences.getInstance();
    return CCard.fromJson(jsonDecode(sp.getString(_CardSttoreKEY) ?? ""));
  }
}