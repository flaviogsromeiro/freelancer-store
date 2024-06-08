// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:my_store/src/core/extensions/parser_extension_object.dart';
import 'package:my_store/src/utils/style/styles.dart';

class AppBarSimple extends StatelessWidget implements PreferredSizeWidget {
  AppBarSimple({
    this.title,
    this.isPop = false,
    super.key,
    this.action,
    this.leading,
  });

  final String? title;
  final List<Widget>? action;
  final Widget? leading;
  bool isPop;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Styles.tertiary,
      titleSpacing: 2,
      toolbarHeight: 65,
      leadingWidth: 65,
      elevation: 0,
      centerTitle: true,
      leading: leading,
      shape: const OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(15),
          bottomRight: Radius.circular(15),
        ),
      ),
      title: title.isNull()
          ? Image.asset(
              'assets/images/logo-extends.png',
              scale: 4,
            )
          : Text(
              title!,
              style: Styles.titleAppBarStyle,
            ),
      actions: action,
      iconTheme: IconThemeData(color: Styles.primary),
    );
  }

  @override
  Size get preferredSize => AppBar().preferredSize;
}
