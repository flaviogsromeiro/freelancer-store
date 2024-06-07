// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:my_store/src/utils/style/styles.dart';

class AppRefreshIndicator extends StatelessWidget {
  const AppRefreshIndicator({
    required this.child,
    required this.onRefresh,
    super.key,
  });

  final Widget child;
  final Future<void> Function() onRefresh;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: onRefresh,
      backgroundColor: Styles.primary,
      color: Styles.quartenary,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          ListView(),
          child,
        ],
      ),
    );
  }
}
