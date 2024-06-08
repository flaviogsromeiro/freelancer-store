// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:my_store/src/utils/style/styles.dart';
import 'package:my_store/src/utils/utils.dart';

class AppObservationField extends StatefulWidget {
  const AppObservationField({
    required this.action,
    super.key,
    this.text,
    this.enable,
  });

  final String? text;
  final void Function(String?) action;
  final bool? enable;

  @override
  State<AppObservationField> createState() => _AppObservationFieldState();
}

class _AppObservationFieldState extends State<AppObservationField> {
  final FocusNode _focusNode = FocusNode();
  late final TextEditingController _controller;
  bool _isFocus = false;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.text ?? '');
    _focusNode.addListener(() {
      if (_focusNode.hasFocus) {
        _isFocus = true;
      } else {
        _isFocus = false;
        widget.action(_controller.text);
      }
      setState(() {});
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Utils.widthSize(context) * 0.25,
      width: double.infinity,
      child: TextFormField(
        onTapOutside: (_) => FocusScope.of(context).unfocus(),
        textCapitalization: TextCapitalization.sentences,
        scrollPadding: const EdgeInsets.only(bottom: 200),
        cursorColor: Styles.primary,
        maxLength: 100,
        enabled: widget.enable ?? true,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        focusNode: _focusNode,
        controller: _controller,
        onEditingComplete: () => widget.action(_controller.text),
        maxLines: 4,
        decoration: InputDecoration(
          errorStyle: const TextStyle(
              fontFamily: Styles.itimFont, fontSize: 12, height: 0.3),
          counterText: '',
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          filled: true,
          fillColor: Colors.transparent,
          labelStyle: TextStyle(
            color: Styles.primary,
            fontFamily: Styles.itimFont,
            fontSize: 18,
          ),
          labelText: 'Descrição',
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
            gapPadding: 25,
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Styles.primary,
            ),
            // gapPadding: 25,
            borderRadius: const BorderRadius.all(Radius.circular(20)),
          ),
          isDense: true,
        ),
      ),
    );
  }
}
