import 'package:flutter/material.dart';

class Styles {
  // Style
  static Color primary = const Color(0xffFF6607);
  static Color secondary = const Color(0xff000000);
  static Color tertiary = const Color.fromARGB(255, 255, 188, 147);
  static Color quartenary = const Color(0xFFFFFFFF);

  static const String itimFont = 'Itim-Regular';

  static TextStyle extend(TextStyle s1, TextStyle s2) {
    return s1.merge(s2);
  }

  static TextStyle titleStyle = TextStyle(
    fontFamily: itimFont,
    fontWeight: FontWeight.bold,
    color: quartenary,
    fontSize: 35,
  );
  static TextStyle titleAppBarStyle = TextStyle(
    fontFamily: itimFont,
    color: secondary,
    fontSize: 25,
  );

  static final TextStyle subTitleStyle = extend(
    titleStyle,
    TextStyle(fontSize: 20, fontWeight: FontWeight.normal, color: secondary),
  );
  static final TextStyle fieldStyle = extend(
    titleStyle,
    TextStyle(fontSize: 15, color: secondary),
  );
}
