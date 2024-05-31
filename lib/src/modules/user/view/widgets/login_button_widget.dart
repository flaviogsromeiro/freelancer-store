// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:my_store/src/ui/buttons/app_button_widget.dart';
import 'package:my_store/src/ui/text/app_text_version.dart';

class LoginButtonWidget extends StatelessWidget {
  LoginButtonWidget({
    required this.onPressed,
    super.key,
    this.isLoading = false,
  });

  bool isLoading;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AppButtonWidget(
            titleButton: 'Entrar',
            isLoading: isLoading,
            onPressed: onPressed,
          ),
          const SizedBox(
            height: 20,
          ),
          const AppTextVersion(),
        ],
      ),
    );
  }
}
