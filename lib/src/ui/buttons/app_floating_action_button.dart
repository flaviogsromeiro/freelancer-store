// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_store/src/utils/style/styles.dart';

class AppFloatingActionButton extends StatelessWidget {
  const AppFloatingActionButton({
    required this.action,
    super.key,
  });

  final VoidCallback action;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: FloatingActionButton(
        onPressed: action,
        backgroundColor: Styles.primary,
        shape: const CircleBorder(),
        child: FaIcon(
          FontAwesomeIcons.plus,
          color: Styles.quartenary,
          size: 30,
        ),
      ),
    );
  }
}
