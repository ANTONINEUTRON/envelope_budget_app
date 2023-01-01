import 'dart:convert';

import '../model/budget.dart';
import 'package:shared_preferences/shared_preferences.dart';

///Will provide api for performing CRUD on budgets
class BudgetRepository{
  final _budgetKey = "BUDGET";//will reference a list of budget jsons
  late SharedPreferences _sharedPref;

  Future<List<Budget>> getAllBudgets() async {
    var pref = await SharedPreferences.getInstance();
    //get list of budget jsons
    List<String> listOfBudgetJsons = pref.getStringList(_budgetKey) ?? [];
    //for each item, convert to object and add to list
    return _decodeBudgetsFromJsonList(listOfBudgetJsons);
  }

  Future<bool> addBudget(Budget budget) async {
    //get budgets
    var budgets = await getAllBudgets();
    //add budget instance
    budgets.add(budget);
    return await _saveBudgets(budgets);
  }

  Future<bool> deleteBudget(Budget budget) async {
    //get budgets
    var budgets = await getAllBudgets();
    //remove budget instance
    budgets.add(budget);
    return await _saveBudgets(budgets);
  }

  List<Budget> _decodeBudgetsFromJsonList(List<String> listOfBudgetJsons) {
    return listOfBudgetJsons.map((budgetJson){
      return Budget.fromJson(jsonDecode(budgetJson));
    }).toList();
  }

  List<String> _encodeBudgetsToJsonList(List<Budget> listOfBudgets) {
    return listOfBudgets.map((budget){
      return jsonEncode(budget.toJson());
    }).toList();
  }

  Future<bool> _saveBudgets(List<Budget> budgets) async {
    //encode each budget as json and add to list
    var listToSave = _encodeBudgetsToJsonList(budgets);
    //save list to sp
    return await _sharedPref.setStringList(_budgetKey, listToSave);
  }

}