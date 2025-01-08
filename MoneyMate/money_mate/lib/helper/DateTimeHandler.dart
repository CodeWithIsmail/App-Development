import '../ImportAll.dart';

DateTime DatetimeHandle(String date) {
  DateTime parsedDate = DateFormat("dd-MMM-yy").parse(date);
  DateTime finalDateTime = DateTime(
    parsedDate.year,
    parsedDate.month,
    parsedDate.day,
    0,
    0,
    0,
    0, // Millisecond
  );
  return finalDateTime;
}
