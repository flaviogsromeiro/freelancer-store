// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:my_store/src/ui/dialogs/dialogs.dart';
import 'package:my_store/src/utils/style/styles.dart';
import 'package:my_store/src/utils/utils.dart';
import 'package:my_store/src/utils/utils_datetime.dart';

class AppDateFormField extends StatefulWidget {
  const AppDateFormField({
    required this.label,
    required this.onAction,
    super.key,
    this.date,
    this.firstDate,
    this.lastDate,
    this.onValidator,
    this.readOnly,
    this.enable,
  });

  final DateTime? date;
  final DateTime? firstDate;
  final DateTime? lastDate;
  final String label;
  final String? Function(String?)? onValidator;
  final bool? readOnly;
  final bool? enable;
  final void Function(DateTime) onAction;

  @override
  State<AppDateFormField> createState() => _AppDateFormFieldState();
}

class _AppDateFormFieldState extends State<AppDateFormField> {
  late final TextEditingController _controller;
  final FocusNode _focusNode = FocusNode();
  final bool _isFocus = false;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(
      text: widget.date != null
          ? UtilsDateTime.formattedDateToView(widget.date!)
          : null,
    );
  }

  @override
  void didUpdateWidget(AppDateFormField oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.date != widget.date) {
      Future.microtask(() {
        if (mounted) {
          setState(() {
            _controller.text = widget.date != null
                ? UtilsDateTime.formattedDateToView(widget.date!)
                : '';
          });
        }
      });
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: Utils.heightSize(context) * 0.01),
      child: TextFormField(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        focusNode: _focusNode,
        cursorColor: Styles.primary,
        controller: _controller,
        validator: widget.onValidator,
        readOnly: widget.readOnly ?? false,
        enabled: widget.enable ?? true,
        onTap: () {
          Dialogs.showDialogDatePicker(
            context: context,
            firstDate: widget.firstDate,
            lastDate: widget.lastDate,
            selectedDate: UtilsDateTime.formatDateTimeFromView(
              _controller.text,
            ),
          ).then((value) {
            if (value != null) {
              setState(
                () =>
                    _controller.text = UtilsDateTime.formattedDateToView(value),
              );
              widget.onAction(value);
            }
            _focusNode.unfocus();
          });
        },
        decoration: InputDecoration(
          labelText: widget.label,
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          filled: true,
          fillColor: Colors.transparent,
          labelStyle: TextStyle(
            color: _isFocus ? Styles.primary : null,
          ),
          contentPadding: const EdgeInsets.all(15),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Styles.primary,
              width: 2,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(20)),
          ),
          errorBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.red,
            ),
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey,
            ),
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          isDense: true,
        ),
      ),
    );
  }
}
