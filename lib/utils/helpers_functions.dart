
import 'package:intl/intl.dart';

double getBottomPaddingForKeyboardToShow(double bottomPadding)
=> bottomPadding > 50 ? bottomPadding - 50 : bottomPadding;


String formatDate(DateTime date) => DateFormat('E, MMM dd y').format(date);
