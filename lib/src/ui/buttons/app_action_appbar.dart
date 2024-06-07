// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:my_store/src/utils/style/styles.dart';
import 'package:my_store/src/utils/utils.dart';

class AppActionAppBar extends StatelessWidget {
  const AppActionAppBar({
    required this.icon,
    required this.action,
    super.key,
  });

  final IconData icon;
  final VoidCallback action;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 12,
      ),
      height: Utils.heightSize(context) * 0.102,
      width: Utils.widthSize(context) * 0.102,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Styles.primary,
      ),
      child: Center(
        child: IconButton(
          onPressed: action,
          icon: Icon(
            icon,
            color: Styles.quartenary,
            size: 18,
          ),
        ),
      ),
    );
  }
}
