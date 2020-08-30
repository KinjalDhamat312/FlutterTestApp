import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

const String dateTimeFormat1 = "yyyy-MM-dd HH:mm:ss";
const String dateTimeFormat2 = "E d MMM yyyy, hh:mm a";

const String timeFormat1 = "hh:mm a";
const String timeFormat2 = "hh:mm:ss";

const String dateFormat1 = "yyyy-MM-dd";
const String dateFormat2 = "d MMM, yyyy";
const String dateFormat3 = "dd MMM yyyy";


String getCurrentDateString(String dateFormat) {
  initializeDateFormatting();
  return DateFormat(dateFormat).format(DateTime.now()).toString();
}

String getUtcDate() {
  var dateUtc = DateTime.now().toUtc();
  var date = DateFormat(dateTimeFormat1).format(dateUtc);
  return date;
}

String getLocalTime(String dateUtc) {
  var dateTime = DateFormat(dateTimeFormat1).parse(dateUtc, true);
  var dateLocal = dateTime.toLocal();
  return DateFormat(timeFormat1)
      .format(dateLocal)
      .replaceAll(' ', '')
      .toLowerCase();
}

String formatDate(String date,
    {String inputFormat = timeFormat2, String resultFormat = timeFormat1}) {
  if (date != null && date.isNotEmpty) {
    var dateTime = DateFormat(inputFormat).parse(date, false);
    var dateLocal = dateTime.toLocal();
    return DateFormat(resultFormat).format(dateLocal);
  }
  return "";
}

String parseDate(String dateUtc) {
  var date = DateFormat(dateTimeFormat1).parse(dateUtc, true);
  var dateLocal = date.toLocal();
  var formattedDate = DateFormat("$dateFormat1").format(dateLocal);
  var currentDate = DateFormat(dateFormat1).format(DateTime.now());
  if (formattedDate == currentDate) {
    return DateFormat(timeFormat1)
        .format(dateLocal)
        .replaceAll(' ', '')
        .toLowerCase();
  }
  return DateFormat(dateFormat3).format(dateLocal);
}
