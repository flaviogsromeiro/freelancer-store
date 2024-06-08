import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:my_store/src/modules/product/view/pages/products_list_screen.dart';
import 'package:my_store/src/utils/style/styles.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: AnimatedSplashScreen(
      backgroundColor: Styles.quartenary,
      splashTransition: SplashTransition.sizeTransition,
      splash: 'assets/images/logo-principal.png',
      duration: 3000,
      splashIconSize: 150,
      nextScreen: const ProductsListScreen(),
    ));
  }
}
