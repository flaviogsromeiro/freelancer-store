import 'package:flutter/material.dart';
import 'package:my_store/src/utils/style/styles.dart';

class AppTextButtonWidget extends StatelessWidget {
  const AppTextButtonWidget({
    required this.onPressed,
    required this.text,
    super.key,
  });

  final VoidCallback onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        padding: MaterialStateProperty.resolveWith<EdgeInsetsGeometry>(
          (states) => const EdgeInsets.symmetric(
            horizontal: 7,
          ),
        ),
        overlayColor: MaterialStateColor.resolveWith(
          (states) => Colors.transparent,
        ),
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: Styles.labelFieldStyle,
      ),
    );
  }
}
