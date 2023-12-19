import 'package:intl/intl.dart';

String getTime(int timezone) {
  final dateTime = DateTime.now().add(
      Duration(seconds: timezone - DateTime.now().timeZoneOffset.inSeconds));
  final time = DateFormat('EEEe dd -').add_jms().format(dateTime);
  return time.toString();
}
