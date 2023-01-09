import 'package:envelope_budget_app/features/income/data/model/income.dart';
import 'package:envelope_budget_app/features/income/ui/bloc/income_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AccountsDropdown extends StatefulWidget {
  const AccountsDropdown({Key? key}) : super(key: key);

  @override
  State<AccountsDropdown> createState() => _AccountsDropdownState();
}

class _AccountsDropdownState extends State<AccountsDropdown> {
  Income? _selectedIncome;

  @override
  Widget build(BuildContext context) {
    List<Income> listOfAccounts = context.watch<IncomeBloc>().state;
    return listOfAccounts.isEmpty
      ? Container()
      : DropdownButton<Income>(
      value: _selectedIncome,
      hint: Text("Select Account"),
      borderRadius: BorderRadius.circular(5),
      items: listOfAccounts.map((account){
        return DropdownMenuItem(
            value: account,
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: FaIcon(
                      mapOfIconsToIncomeTypes[account.incomeType]
                  ),
                ),
                Text(account.incomeType.name.replaceAll("_", " ").toUpperCase())
              ],
            )
        );
      }).toList(),
      onChanged: (newIncome){
        setState(() {
          _selectedIncome = newIncome;
        });
      },
    );
  }
}
