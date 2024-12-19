import 'package:intl/intl.dart';

class FormaterNumber {
  static String humanReadableNumber(int number) {
    final formatedNumber =
        NumberFormat.compactCurrency(decimalDigits: 0, symbol: '')
            .format(number);
    return formatedNumber;
  }
}
