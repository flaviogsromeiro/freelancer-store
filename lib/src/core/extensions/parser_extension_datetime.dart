import 'package:intl/intl.dart';

extension DateTimeExtension on DateTime {
  String formatToDB() => DateFormat('yyyy-MM-dd HH:mm:ss').format(this);

  String formatToView() => DateFormat('dd/MM/yyyy').format(this);

  static DateTime formatDateFromDB(String value) => DateTime.parse(value);
}
