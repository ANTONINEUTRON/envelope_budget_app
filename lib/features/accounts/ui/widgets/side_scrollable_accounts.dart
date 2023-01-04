import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:envelope_budget_app/features/accounts/data/model/account.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../bloc/account_bloc.dart';
import 'account_grid_ui.dart';

class SideScrollableAccounts extends StatefulWidget {
  const SideScrollableAccounts({Key? key}) : super(key: key);

  @override
  State<SideScrollableAccounts> createState() => _SideScrollableAccountsState();
}

class _SideScrollableAccountsState extends State<SideScrollableAccounts> {


  @override
  Widget build(BuildContext context) {
    List<Account> _accounts = context.watch<AccountBloc>().state;

    double height = 150;
    return ListView(
      scrollDirection: Axis.horizontal,
      children: [
        SizedBox(
          height: height,
          width: height,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: _accounts.length,
            itemBuilder: (context, index){
              var account = _accounts[index];

              return AccountGridUI(account: account,);
            },
          ),
        ),

      ],
    );
  }
}
