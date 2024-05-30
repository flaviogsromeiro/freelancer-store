import 'package:flutter/material.dart';

class Styles {
  // Style
  static Color primary = Colors.green;
  static Color primatySecondary = const Color.fromARGB(255, 233, 108, 126);
  static Color secondary = const Color.fromARGB(255, 4, 90, 14);
  static Color tertiary = Colors.white;
  static Color tertiarySecondaty = const Color.fromARGB(255, 221, 234, 101);
  static Color grey = const Color.fromARGB(255, 207, 207, 207);

  static const String robotoFont = 'Roboto';

  static TextStyle extend(TextStyle s1, TextStyle s2) {
    return s1.merge(s2);
  }

  static TextStyle titleStyle = TextStyle(
    fontFamily: robotoFont,
    fontWeight: FontWeight.bold,
    color: tertiary,
    fontSize: 35,
  );
  static TextStyle titleAppBarStyle = TextStyle(
    fontFamily: robotoFont,
    color: tertiary,
    fontSize: 20,
  );

  static final TextStyle subTitleStyle = extend(
    titleStyle,
    TextStyle(fontSize: 20, fontWeight: FontWeight.normal, color: secondary),
  );
  static final TextStyle labelFieldStyle = extend(
    titleStyle,
    TextStyle(fontSize: 15, color: secondary),
  );
}
