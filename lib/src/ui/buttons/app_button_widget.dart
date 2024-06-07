// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:my_store/src/utils/style/styles.dart';

class AppButtonWidget extends StatelessWidget {
  const AppButtonWidget({
    required this.titleButton,
    required this.onPressed,
    required this.isLoading,
    super.key,
  });

  final String titleButton;
  final VoidCallback onPressed;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      height: 45,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          disabledBackgroundColor: Styles.quartenary,
          backgroundColor: Styles.primary,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(30)),
          ),
        ),
        onPressed: isLoading ? null : onPressed,
        child: isLoading
            ? _isLoading()
            : Text(
                titleButton,
                style: Styles.titleStyle.copyWith(fontSize: 20),
              ),
      ),
    );
  }

  Widget _isLoading() {
    return SizedBox(
      height: 25,
      width: 25,
      child: CircularProgressIndicator(
        color: Styles.quartenary,
      ),
    );
  }
}
