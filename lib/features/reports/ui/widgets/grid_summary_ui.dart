
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class GridSummaryUI extends StatelessWidget {
  const GridSummaryUI({Key? key, required this.label, required this.fAI, required this.amount}) : super(key: key);
  final String label;
  final IconData fAI;
  final String amount;

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
            FaIcon(
                fAI,
              size: 40,
            ),
            Text(
                amount,
              style: GoogleFonts.alumniSans(
                  fontSize: 28,

              ),
            ),
            Text(
                label,
              style: GoogleFonts.averageSans(
                fontSize: 19,
                fontWeight: FontWeight.w500
              ),
            )
          ],
        ),
      ),
    );
  }
}
