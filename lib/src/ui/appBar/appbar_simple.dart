// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:my_store/src/ui/buttons/app_back_widget.dart';
import 'package:my_store/src/utils/style/styles.dart';

class AppBarSimple extends StatelessWidget implements PreferredSizeWidget {
  AppBarSimple({
    required this.title,
    this.isPop = false,
    super.key,
    this.action,
  });

  final String title;
  final List<Widget>? action;
  bool isPop;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Styles.primatySecondary,
      titleSpacing: 2,
      toolbarHeight: 65,
      leading: AppBackWidget(
        isPop: isPop,
      ),
      leadingWidth: 65,
      elevation: 0,
      centerTitle: true,
      title: Text(
        title,
        style: TextStyle(color: Styles.tertiary),
      ),
      actions: action,
    );
  }

  @override
  Size get preferredSize => AppBar().preferredSize;
}
