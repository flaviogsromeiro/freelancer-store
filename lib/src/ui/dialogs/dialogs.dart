import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_store/src/ui/buttons/app_text_button_dialog.dart';
import 'package:my_store/src/ui/dialogs/app_simple_message_dialog.dart';
import 'package:my_store/src/utils/style/styles.dart';
import 'package:my_store/src/utils/utils.dart';

class Dialogs {
  /// Exibe o modal com uma messagem de sucesso.
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

  /// Exibe o modal com uma messagem de erro.
  static Future<void> showModalErrorMessage(
    BuildContext context, {
    required String message,
  }) {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        Future.delayed(const Duration(seconds: 1), () {
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

  static Future<void> showModalDeleteOrEdit({
    required BuildContext context,
    required String message,
    required VoidCallback onEdit,
    required VoidCallback onDelete,
  }) async {
    await showModalBottomSheet<int>(
      context: context,
      builder: (BuildContext context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 10, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Escolha uma opção',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Styles.primary,
                    ),
                  ),
                  IconButton(
                    alignment: AlignmentDirectional.bottomCenter,
                    onPressed: () => Navigator.pop(context),
                    icon: Icon(
                      Icons.close,
                      size: 30,
                      color: Colors.grey.withOpacity(0.8),
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              color: Styles.primatySecondary,
              indent: 15,
              endIndent: 15,
            ),
            ListView(
              shrinkWrap: true,
              children: [
                ListTile(
                  leading: const Icon(Icons.edit),
                  title: const Text('Editar'),
                  onTap: onDelete,
                ),
                ListTile(
                  leading: const Icon(Icons.delete),
                  title: const Text('Excluir'),
                  onTap: () {
                    Navigator.of(context).pop();
                    showDialogActionDelete(
                      context: context,
                      message: message,
                      action: onDelete,
                    );
                  },
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  static Future<bool> showDialogActionDelete({
    required BuildContext context,
    required String message,
    required VoidCallback action,
  }) async {
    var isDelete = true;

    await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.white,
        shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        title: const Text(
          'Confirmação',
          style: TextStyle(fontSize: 20),
        ),
        content: Text(
          message,
          style: const TextStyle(
            fontSize: 15,
            color: Color.fromARGB(255, 109, 109, 109),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text(
              'Cancelar',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              action();
              Navigator.of(context).pop(true);
            },
            style: TextButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              foregroundColor: Styles.primatySecondary,
              backgroundColor: Styles.primary,
            ),
            child: const Text('Excluir'),
          ),
        ],
      ),
    ).then((value) {
      if (value != null) {
        isDelete = value;
      }
    });

    return isDelete;
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
          backgroundColor: Styles.tertiary,
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
                      color: const Color.fromARGB(255, 98, 98, 98),
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

  static Future<DateTime?> showDialogDatePicker({
    required BuildContext context,
    DateTime? selectedDate,
    DateTime? firstDate,
    DateTime? lastDate,
  }) async {
    return showDatePicker(
      context: context,
      firstDate: firstDate ?? DateTime.now(),
      lastDate: lastDate ?? DateTime(2101),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            datePickerTheme: DatePickerThemeData(
              dividerColor: Styles.primatySecondary,
              backgroundColor: Styles.tertiary,
              headerForegroundColor: Styles.tertiary,
              headerBackgroundColor: Styles.primary,
              weekdayStyle: TextStyle(
                color: Styles.primary,
              ),
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                textStyle: const TextStyle(fontSize: 18),
                foregroundColor: Styles.primary,
              ),
            ),
          ),
          child: child!,
        );
      },
    );
  }

  /// Retorna a widget snackbar com uma mensagem.
  static void showSnackBarMessage(
    BuildContext context, {
    required String message,
    required Color color,
  }) {
    final snackBar = SnackBar(
      content: Text(message),
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
