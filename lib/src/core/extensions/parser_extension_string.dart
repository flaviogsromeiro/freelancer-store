import 'package:intl/intl.dart';

extension ParserExtensionString on String {
  bool getStatusFromBool() {
    if (this == 'S') {
      return true;
    }
    return false;
  }

  String capitalize() {
    return isEmpty ? this : this[0].toUpperCase() + substring(1);
  }

  int? convertToInt() {
    if (isNotEmpty) {
      return int.parse(replaceAll('.', ''));
    }
    return null;
  }

  double? convertToDouble() {
    if (isNotEmpty) {
      final format = NumberFormat.decimalPattern('pt_BR');
      return format.parse(this).toDouble();
    }
    return null;
  }

  String replacePatternMoeda() {
    return trim().replaceAll(r'R$', '');
  }
}
