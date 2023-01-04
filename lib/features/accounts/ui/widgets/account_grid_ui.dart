import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../data/model/account.dart';

class AccountGridUI extends StatelessWidget {
  const AccountGridUI({Key? key, required this.account}) : super(key: key);

  final Account account;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            FaIcon(FontAwesomeIcons.moneyBill),
            Text(
              "${account.balance}",
              style: Theme.of(context).textTheme.headline6,
            ),
            Text(
              account.label,
              style: GoogleFonts.averageSans(
                  fontSize: 19
              ),
            )
          ],
        ),
      ),
    );
  }
}
