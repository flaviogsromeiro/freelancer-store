import 'package:flutter/material.dart';
import 'package:my_store/src/utils/style/styles.dart';

class LoginTitleWidget extends StatelessWidget {
  const LoginTitleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            'Bem vindo',
            style: Styles.titleStyle.copyWith(color: Styles.primatySecondary),
          ),
          Text(
            'Faça login para continuar',
            style: Styles.subTitleStyle,
          ),
        ],
      ),
    );
  }
}
