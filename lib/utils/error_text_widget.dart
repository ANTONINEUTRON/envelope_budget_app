import 'package:flutter/material.dart';

class ErrorTextWidget extends StatelessWidget {
  const ErrorTextWidget({
    Key? key,
    required this.errorMsg,
  }) : super(key: key);

  final String errorMsg;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: errorMsg.isEmpty
          ? Container()
          : Text(
        errorMsg,
        style: Theme.of(context).textTheme.labelMedium?.copyWith(
            color: Colors.red.shade700
        ),
      ),
    );
  }
}
