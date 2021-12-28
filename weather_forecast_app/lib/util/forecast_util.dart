import 'package:intl/intl.dart';

class Util {
  // never change
  static String appId = "Your own appId"

  static String getFormattedDate(DateTime dateTime) {

    return new DateFormat('EEEE, MMM d, y, hh:mm:aa').format(dateTime);
  }
}
