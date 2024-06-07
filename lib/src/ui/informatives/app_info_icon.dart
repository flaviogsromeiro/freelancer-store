// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_store/src/utils/style/styles.dart';

class AppInfoIcon extends StatelessWidget {
  const AppInfoIcon({
    required this.icon,
    super.key,
  });

  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 50,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border.all(color: Styles.quartenary),
        color: Styles.tertiary,
        shape: BoxShape.circle,
      ),
      child: FaIcon(
        icon,
        color: Styles.quartenary,
      ),
    );
  }
}
