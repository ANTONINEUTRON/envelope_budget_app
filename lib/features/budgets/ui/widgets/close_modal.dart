
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CloseModal extends StatelessWidget {
  const CloseModal({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        onPressed: (){
          Navigator.pop(context);
        },
        child: Row(
          children: [
            FaIcon(
                FontAwesomeIcons.x
            ),
            Text("CANCEL")
          ],
        )
    );
  }
}