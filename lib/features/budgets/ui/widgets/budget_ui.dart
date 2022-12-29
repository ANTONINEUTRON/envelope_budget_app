import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';


class BudgetUI extends StatelessWidget {
  const BudgetUI({Key? key, this.onTap}) : super(key: key);
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.translucent,
      child: Container(
        padding: EdgeInsets.fromLTRB(16, 5, 15, 3),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            FaIcon(
                FontAwesomeIcons.solidEnvelope
            ),
            Container(padding: EdgeInsets.all(6),),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Title in a long a shsowwkdmn slor loremwmwm, wmnwm bulabu",
                    style: GoogleFonts.dmSans(
                        textStyle: Theme.of(context).textTheme.bodyLarge,
                        fontSize: 16
                    ),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                              "Limit"
                          ),
                          Text(
                              "Spent"
                          ),
                          Text(
                              "Remaining"
                          )
                        ],
                      ),
                      Text(
                        "Dec 20th, 2022",
                        style: GoogleFonts.acme(),
                      )
                    ],
                  ),
                  Slider(
                    value: 28,
                    onChanged: (newValue){},
                    label: "Remaining",
                    max: 100,
                    min: 0,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
