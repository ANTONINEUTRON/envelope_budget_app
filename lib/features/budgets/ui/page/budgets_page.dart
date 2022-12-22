import 'package:flutter/material.dart';

class BudgetsPage extends StatefulWidget {
  const BudgetsPage({Key? key}) : super(key: key);

  @override
  State<BudgetsPage> createState() => _BudgetsPageState();
}

class _BudgetsPageState extends State<BudgetsPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("Dashboard"),
    );
  }
}
