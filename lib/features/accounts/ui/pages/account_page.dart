
import 'package:envelope_budget_app/features/accounts/data/model/account.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../bloc/account_bloc.dart';
import '../widgets/account_grid_ui.dart';
import '../widgets/add_account.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    List<Account> accounts = context.watch<AccountBloc>().state;
    return Scaffold(
      appBar: AppBar(
        title: Text("Accounts"),
      ),
      body: GridView(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          mainAxisExtent: 150
        ),
        children: [
          for(var account in accounts) AccountGridUI(account: account),
          SizedBox(
              height: 150,
              width: 150,
              child: GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: (){
                  showModalBottomSheet(
                      context: context,
                      builder: (context){
                        return AddAccount();
                      }
                  );
                },
                child: const Card(
                  child: Center(
                    child: FaIcon(
                      FontAwesomeIcons.plus,
                      size: 100,
                      color: Colors.lightBlue,
                    ),
                  ),
                ),
              )
          )
        ],
      ),
    );
  }
}
