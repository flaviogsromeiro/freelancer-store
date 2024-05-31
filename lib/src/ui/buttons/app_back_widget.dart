// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_store/src/ui/dialogs/dialogs.dart';
import 'package:my_store/src/utils/style/styles.dart';

class AppBackWidget extends StatelessWidget {
  AppBackWidget({
    super.key,
    this.isPop = false,
  });

  bool isPop;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 12,
      ),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Styles.primary,
      ),
      child: Center(
        child: IconButton(
          onPressed: () {
            if (isPop) {
              Dialogs.showDialogAction(
                context: context,
                title: 'Sair sem salvar',
                titleAction: 'Sim',
                onPressed: () => Navigator.pop(context),
              );
            } else {
              Navigator.pop(context);
            }
          },
          icon: Icon(
            FontAwesomeIcons.arrowLeft,
            color: Styles.tertiary,
            size: 20,
          ),
        ),
      ),
    );
  }
}
