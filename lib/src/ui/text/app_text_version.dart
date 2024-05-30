import 'package:flutter/material.dart';
import 'package:my_store/src/utils/style/styles.dart';

class AppTextVersion extends StatelessWidget {
  const AppTextVersion({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'Version 1.0.2',
      style: Styles.subTitleStyle.copyWith(fontSize: 15),
    );
  }
}
