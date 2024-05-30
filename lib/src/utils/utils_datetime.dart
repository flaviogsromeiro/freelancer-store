import 'package:intl/intl.dart';

class UtilsDateTime {
  static String formattedDateDB(DateTime date) {
    return DateFormat('dd/MM/yyyy HH:mm:ss').format(date);
  }

  static String formattedDateToView(DateTime date) {
    return DateFormat('dd/MM/yyyy').format(date);
  }

  static DateTime? formatDateTimeFromView(String date) {
    final re = RegExp(
      '^'
      '(?<day>[0-9]{1,2})'
      '/'
      '(?<month>[0-9]{1,2})'
      '/'
      '(?<year>[0-9]{4,})'
      r'$',
    );

    final match = re.firstMatch(date);

    if (match == null) return null;

    return DateTime(
      int.parse(match.namedGroup('year')!),
      int.parse(match.namedGroup('month')!),
      int.parse(match.namedGroup('day')!),
    );
  }

  static DateTime getOneYearAgoDate() {
    final now = DateTime.now();
    return DateTime(now.year - 1, now.month, now.day);
  }
}
