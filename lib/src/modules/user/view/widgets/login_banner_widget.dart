import 'package:flutter/material.dart';
import 'package:my_store/src/utils/style/styles.dart';

class LoginBannerWidget extends StatelessWidget {
  const LoginBannerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 150),
      child: Transform.scale(
        scale: 5,
        alignment: const FractionalOffset(0.5, 0.7),
        child: Container(
          height: 110,
          decoration: BoxDecoration(
            color: Styles.primary,
            shape: BoxShape.circle,
            image: const DecorationImage(
              alignment: FractionalOffset(0.5, 0.83),
              scale: 15,
              image: AssetImage(
                'assets/icon-store.png',
              ),
            ),
          ),
        ),
      ),
    );
  }
}
