import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_store/src/ui/buttons/app_text_button_dialog.dart';
import 'package:my_store/src/ui/dialogs/app_simple_message_dialog.dart';
import 'package:my_store/src/utils/style/styles.dart';
import 'package:my_store/src/utils/utils.dart';

class Dialogs {
  static Future<void> showModalSuccessMessage(
    BuildContext context, {
    required String message,
  }) {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (_) {
        Future.delayed(const Duration(seconds: 2), () {
          Navigator.of(context).pop();
        });
        return AppSimpleMessageDialog(
          description: message,
          icon: FontAwesomeIcons.check,
          dialogColor: Colors.green,
        );
      },
    );
  }

  static Future<void> showModalErrorMessage(
    BuildContext context, {
    required String message,
  }) {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        Future.delayed(const Duration(seconds: 3), () {
          Navigator.of(context).pop();
        });
        return AppSimpleMessageDialog(
          description: message,
          icon: FontAwesomeIcons.xmark,
          dialogColor: Colors.red,
        );
      },
    );
  }

  static void apresentarMensagem({
    required BuildContext context,
    required String msg,
    bool erro = false,
  }) {
    var color = Colors.green;

    if (erro) {
      color = Colors.red;
    }
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        //behavior: SnackBarBehavior.floating,
        backgroundColor: color,
        content: Text(
          msg,
        ),
        duration: const Duration(seconds: 1),
      ),
    );
  }

  static Future<bool> showDialogAction({
    required BuildContext context,
    required String title,
    required String titleAction,
    required VoidCallback onPressed,
  }) async {
    bool? isAction;

    isAction = await showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          backgroundColor: Styles.quartenary,
          actionsAlignment: MainAxisAlignment.center,
          titlePadding: const EdgeInsets.only(top: 10),
          actionsPadding: EdgeInsets.zero,
          contentPadding: EdgeInsets.zero,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: Utils.heightSize(context) * 0.022,
                  color: Styles.primary,
                ),
              ),
            ],
          ),
          content: const Divider(),
          actions: <Widget>[
            Flex(
              direction: Axis.horizontal,
              children: [
                Expanded(
                  flex: 5,
                  child: SizedBox(
                    child: AppTextButtonDialog(
                      action: () async => Navigator.of(
                        context,
                      ).pop(),
                      title: 'Voltar',
                      color: Styles.secondary,
                    ),
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: AppTextButtonDialog(
                    action: () async {
                      Navigator.of(context).pop(true);
                      onPressed();
                    },
                    title: titleAction,
                    color: Styles.primary,
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );

    return isAction ?? false;
  }

  static void showSnackBarMessage(
    BuildContext context, {
    required String message,
    required Color color,
  }) {
    final snackBar = SnackBar(
      content: Text(
        message,
        style: const TextStyle(fontFamily: Styles.itimFont, fontSize: 15),
      ),
      duration: const Duration(seconds: 2),
      backgroundColor: color,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
      ),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
