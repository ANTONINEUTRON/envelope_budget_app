import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../widgets/expense_widget.dart';
import '../widgets/income_widget.dart';

class RecordTransactionsPage extends StatefulWidget {
  RecordTransactionsPage({Key? key}) : super(key: key);

  static final route =  MaterialPageRoute(builder: (context)=>RecordTransactionsPage());

  @override
  State<RecordTransactionsPage> createState() => _RecordTransactionsPageState();
}

class _RecordTransactionsPageState extends State<RecordTransactionsPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 1,
      child: Scaffold(
        appBar: AppBar(
          leading: ElevatedButton(
              onPressed: (){
                Navigator.pop(context);
              },
              child: Row(
                children: [
                  FaIcon(
                      FontAwesomeIcons.x
                  ),
                  // Text("CANCEL")
                ],
              )
          ),
          // actions: [
          //   ElevatedButton(
          //       onPressed: (){},
          //       child: Row(
          //         children: [
          //           FaIcon(
          //             FontAwesomeIcons.circleCheck
          //           ),
          //           Text("SAVE")
          //         ],
          //       )
          //   )
          // ],
          bottom: const TabBar(
            tabs: [
              Tab(
                text: "INCOME",
                icon: FaIcon(FontAwesomeIcons.piggyBank),
              ),
              Tab(
                text: "EXPENSE",
                icon: FaIcon(FontAwesomeIcons.moneyBill),
              )
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            IncomeWidget(),
            ExpenseWidget()
          ],
        ),
      ),
    );
  }
}
