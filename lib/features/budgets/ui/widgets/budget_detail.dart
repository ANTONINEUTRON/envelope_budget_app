import 'package:envelope_budget_app/features/budgets/data/model/budget.dart';
import 'package:envelope_budget_app/features/budgets/ui/bloc/budget_bloc.dart';
import 'package:envelope_budget_app/features/budgets/ui/widgets/close_modal.dart';
import 'package:envelope_budget_app/utils/helpers_functions.dart';
import 'package:envelope_budget_app/utils/success_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../utils/error_text_widget.dart';
import '../../data/model/expense.dart';
import '../page/expense_page.dart';
import 'budget_ui.dart';

class BudgetDetail extends StatefulWidget {
  const BudgetDetail({Key? key, required this.budget}) : super(key: key);
  final Budget budget;

  @override
  State<BudgetDetail> createState() => _BudgetDetailState();
}

class _BudgetDetailState extends State<BudgetDetail> {
  var _amount = 0.0;
  var _label = "";
  var _errorMsg = "";
  var _successMsg = "";
  var _amountController = TextEditingController();
  var _labelController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var bloc = context.watch<BudgetBloc>();
    var noOfExpenses = widget.budget.expenses.length;

    return Container(
      padding: EdgeInsets.fromLTRB(15, 3, 15,
          getBottomPaddingForKeyboardToShow(
              MediaQuery.of(context).viewInsets.bottom)),
      child: ListView(
        shrinkWrap: true,
        children: [
          // CloseModal(),
          SuccessTextWidget(msg: _successMsg),
          ErrorTextWidget(errorMsg: _errorMsg),
          BudgetUI(budget: widget.budget,),
          ElevatedButton(
            onPressed: (){
              Navigator.push(context, ExpensePage.route(widget.budget.expenses));
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("View Expenses ($noOfExpenses)"),
                FaIcon(FontAwesomeIcons.angleRight)
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(top: 8, bottom: 7),
            child: Text(
                "Record Expenses",
              style: Theme.of(context).textTheme.headline5,
            ),
          ),
          TextField(
            onChanged: (newAmount)=> _amount= double.tryParse(newAmount) ?? 0.0,
            maxLines: 1,
            controller: _amountController,
            decoration: InputDecoration(
                labelText: "AMOUNT",
                hintText: "0.0",
                border: OutlineInputBorder()
            ),
            keyboardType: TextInputType.numberWithOptions(decimal: true),
          ),
          Padding(
            padding: const EdgeInsets.only(top:8.0),
            child: TextField(
              onChanged: (newLabel)=> _label=newLabel,
              maxLines: 1,
              controller: _labelController,
              decoration: InputDecoration(
                  labelText: "ADD NOTE",
                  border: OutlineInputBorder()
              ),
            ),
          ),
          ElevatedButton(
              onPressed: (){
                //validate input
                if(_areInputsValid()) {
                  //save to bloc
                  ///add expense to budget
                  var expense = Expense(
                    id: DateTime.now(),
                    label: _label,
                    amount: _amount
                  );
                  var updatedBudget = widget.budget;
                  updatedBudget.expenses.add(expense);
                  ///pass budget to bloc.updateBudget
                  context.read<BudgetBloc>().updateBudget(updatedBudget);
                  resetValues();
                }
              },
              child: Text("SAVE")
          )
        ],
      ),
    );
  }

  void resetValues() {
    _successMsg = "Expense has been added successfully";
    _errorMsg = "";
    _amountController.text = "";
    _labelController.text = "";
    setState((){});
    Future.delayed(const Duration(seconds: 20),()=>setState(()=> _successMsg=""));
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
    }else if(_amount > (widget.budget.getRemsAmount()) || _amount < 1){
      setState(() {
        _errorMsg = "Invalid amount entered!";
      });
      return false;
    }
    return true;
  }
}
