import 'dart:convert';

import '../model/budget.dart';
import 'package:shared_preferences/shared_preferences.dart';

///Will provide api for performing CRUD on budgets
class BudgetRepository{
  final _budgetKey = "BUDGET";//will reference a list of budget jsons

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

  Future<bool> updateBudget(Budget budget) async {
    //get budgets
    var budgets = await getAllBudgets();
    //remove budget instance
    var hasRemoved = budgets.remove(budget);
    //add Budget instance
    budgets.add(budget);
    return await _saveBudgets(budgets);
  }

  Future<List<Budget>> _decodeBudgetsFromJsonList(List<String> listOfBudgetJsons) async {
    return listOfBudgetJsons.map((budgetJson){
      return Budget.fromJson(jsonDecode(budgetJson));
    }).toList();
  }

  Future<List<String>> _encodeBudgetsToJsonList(List<Budget> listOfBudgets) async {
    return listOfBudgets.map((budget){
      return jsonEncode(budget.toJson());
    }).toList();
  }

  Future<bool> _saveBudgets(List<Budget> budgets) async {
    var sharedPref = await SharedPreferences.getInstance();
    //encode each budget as json and add to list
    var listToSave = await _encodeBudgetsToJsonList(budgets);
    //save list to sp
    return await sharedPref.setStringList(_budgetKey, listToSave);
  }

}