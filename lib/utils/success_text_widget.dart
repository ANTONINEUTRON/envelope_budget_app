import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SuccessTextWidget extends StatelessWidget {
  const SuccessTextWidget({
    Key? key,
    required this.msg,
  }) : super(key: key);

  final String msg;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom:10.0),
      child: msg.isEmpty
          ? Container()
          : Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FaIcon(FontAwesomeIcons.check, color: Colors.green.shade700,),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  msg,
                  style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          color: Colors.green.shade700
                  ),
                ),
              ),
            ],
          ),
    );
  }
}
