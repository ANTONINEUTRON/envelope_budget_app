import 'package:flutter/material.dart';

class IncomeWidget extends StatefulWidget {
  const IncomeWidget({Key? key}) : super(key: key);

  @override
  State<IncomeWidget> createState() => _IncomeWidgetState();
}

class _IncomeWidgetState extends State<IncomeWidget> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        TextField(
          maxLines: 5,
          decoration: InputDecoration(
            labelText: "ADD NOTES"
          ),
        )
      ],
    );
  }
}
