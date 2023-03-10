import 'package:envelope_budget_app/features/budgets/data/model/budget.dart';
import 'package:envelope_budget_app/features/budgets/ui/bloc/budget_bloc.dart';
import 'package:envelope_budget_app/features/budgets/ui/widgets/close_modal.dart';
import 'package:envelope_budget_app/utils/helpers_functions.dart';
import 'package:envelope_budget_app/utils/success_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../services/notification_service.dart';
import '../../../../utils/error_text_widget.dart';
import '../../../home/ui/bloc/balance_bloc.dart';
import '../../../notifications/data/model/notification.dart';
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

  String _account = "";
  String _bank = "";

  @override
  Widget build(BuildContext context) {
    var notSer = NotificationService(context: context);
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
          // BudgetUI(budget: widget.budget,),
          ElevatedButton(
            onPressed: (){
              Navigator.push(context, ExpensePage.route(budget: widget.budget));
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
          Padding(
            padding: const EdgeInsets.only(top:8.0),
            child: Row(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.45,
                  child: TextField(
                    onChanged: (value)=> _account=value,
                    maxLines: 1,
                    decoration: InputDecoration(
                        labelText: "Account Number",
                        border: OutlineInputBorder()
                    ),
                    keyboardType: TextInputType.number,
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.43,
                  child: TextField(
                    onChanged: (value)=> _bank = value,
                    maxLines: 1,
                    decoration: InputDecoration(
                        labelText: "Bank Name",
                        border: OutlineInputBorder()
                    ),
                  ),
                ),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: (){
              if(!_areInputsValid()) return;
              //navigator close
              Navigator.pop(context);
              //clear error state
              _errorMsg = "";
              //save to bloc
              ///add expense to budget
              recordExpense(context);
              // notSer.sendMessage("You made an Expense from '${widget.budget.label}' Budget which costs $_amount", NotificationType.normal);
              //Check if budget has been exceeded
              if(widget.budget.getAmountSpent() / widget.budget.amount > 0.7 && daysBetween(DateTime.now(), widget.budget.deadline) > 5 && !widget.budget.hasBudgetExceededAlertShown){
                notSer.sendMessage("You have exceeded 70% of '${widget.budget.label}' Budget in a short while.\nYou are kindly advice to spend wisely", NotificationType.warning);
              }
              resetValues();
            },
            child: Text("Make Payment"),
          ),
        ],
      ),
    );
  }

  void recordExpense(BuildContext context) {
    var expense = Expense(
        id: DateTime.now(),
        label: _label,
        amount: _amount
    );
    var updatedBudget = widget.budget;
    updatedBudget.expenses.add(expense);
    ///pass budget to bloc.updateBudget
    context.read<BudgetBloc>().updateBudget(updatedBudget);
    context.read<BalanceBloc>().debitBalance(_amount);
  }

  void resetValues() {
    _successMsg = "Expense has been added successfully";
    _errorMsg = "";
    _amountController.text = "";
    _labelController.text = "";
    setState((){});
  }

  int daysBetween(DateTime from, DateTime to) {
    from = DateTime(from.year, from.month, from.day);
    to = DateTime(to.year, to.month, to.day);
    return (to.difference(from).inHours / 24).round();
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
    }else if(_amount > context.read<BalanceBloc>().state){
      setState(() {
        _errorMsg = "Amount entered exceeds your wallet balance\nPlease Fund You account";
      });
      return false;
    }else if(_account.length != 10){
      setState(() {
        _errorMsg = "Please enter a valid account number";
      });
      return false;
    }
    return true;
  }
}
