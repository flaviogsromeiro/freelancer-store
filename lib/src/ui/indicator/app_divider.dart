import 'package:flutter/material.dart';
import 'package:my_store/src/utils/style/styles.dart';

class AppDivider extends StatelessWidget {
  const AppDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      
      children: [
        Expanded(
          child: Divider(
            color: Styles.primatySecondary,
            height: 6,
            thickness: 1,
          ),
        ),
        Container(
          width: 8,
          height: 8,
          decoration: BoxDecoration(
            color: Styles.primatySecondary,
            shape: BoxShape.circle,
          ),
        ),
      ],
    );
  }
}
