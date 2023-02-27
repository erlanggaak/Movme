import 'package:intl/intl.dart';

class DateFormatter {
  static String parse(DateTime dateTime) {
    DateFormat formatter = DateFormat('MMM dd, yyyy');
    return formatter.format(dateTime);
  }
}