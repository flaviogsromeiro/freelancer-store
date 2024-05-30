import 'package:flutter/material.dart';

class AppTextButtonDialog extends StatelessWidget {
  const AppTextButtonDialog({
    required this.action,
    required this.title,
    required this.color,
    super.key,
  });

  final VoidCallback action;
  final String title;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: action,
      child: Text(
        title,
        style: TextStyle(color: color, fontSize: 18),
      ),
    );
  }
}
