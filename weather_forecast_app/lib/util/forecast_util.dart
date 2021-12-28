import 'package:intl/intl.dart';

class Util {
  // see your appId, https://home.openweathermap.org/api_keys
  
  // never change
  static String appId = "Your own appId"

  static String getFormattedDate(DateTime dateTime) {

    return new DateFormat('EEEE, MMM d, y, hh:mm:aa').format(dateTime);
  }
}
