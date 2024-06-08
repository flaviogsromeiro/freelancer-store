// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_store/src/utils/style/styles.dart';

class AppTextFormField extends StatefulWidget {
  const AppTextFormField({
    required this.action,
    required this.label,
    super.key,
    this.text,
    this.hintText,
    this.enable,
    this.characterLimit,
    this.textInputType,
    this.onValidator,
    this.onlyRead,
    this.inputFormatters,
    this.controller,
  });

  final String? text;
  final String? hintText;
  final bool? enable;
  final void Function(String?) action;
  final int? characterLimit;
  final String label;
  final TextInputType? textInputType;
  final String? Function(String?)? onValidator;
  final bool? onlyRead;
  final List<TextInputFormatter>? inputFormatters;
  final TextEditingController? controller;

  @override
  State<AppTextFormField> createState() => _AppTextFormFieldState();
}

class _AppTextFormFieldState extends State<AppTextFormField> {
  final FocusNode _focusNode = FocusNode();
  late final TextEditingController _controller;
  bool _isFocus = false;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      if (_focusNode.hasFocus) {
        _isFocus = true;
      } else {
        _isFocus = false;
        widget.action(_controller.text);
      }
      setState(() {});
    });
    _controller =
        widget.controller ?? TextEditingController(text: widget.text ?? '');
  }

  @override
  void dispose() {
    _focusNode.removeListener(_handleFocusChange);
    if (widget.controller == null) {
      _controller.dispose();
    }
    super.dispose();
  }

  void _handleFocusChange() {
    setState(() {
      _isFocus = _focusNode.hasFocus;
      if (!_isFocus) {
        widget.action(_controller.text);
      }
    });
  }

  @override
  void didUpdateWidget(AppTextFormField oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.text != widget.text) {
      Future.microtask(() {
        if (mounted) {
          setState(() {
            _controller.text = widget.text != null ? widget.text! : '';
          });
        }
      });
    }
  }

  void setValueText(String text) => setState(() {
        if (widget.controller != null) {
          widget.controller!.text = widget.text ?? '';
        }
      });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTapOutside: (_) => FocusScope.of(context).unfocus(),
      textCapitalization: TextCapitalization.sentences,
      scrollPadding: const EdgeInsets.only(bottom: 200),
      enabled: widget.enable ?? true,
      keyboardType: widget.textInputType,
      cursorColor: Styles.primary,
      readOnly: widget.onlyRead ?? false,
      maxLength: widget.characterLimit,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      focusNode: _focusNode,
      inputFormatters: widget.inputFormatters,
      controller: _controller,
      validator: widget.onValidator,
      decoration: InputDecoration(
        hintText: widget.hintText,
        errorStyle: const TextStyle(
          fontFamily: Styles.itimFont,
          fontSize: 12,
          height: 0.3,
        ),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        filled: true,
        fillColor: Colors.transparent,
        counterText: '',
        labelStyle: TextStyle(
            color: Styles.primary,fontFamily: Styles.itimFont,  fontSize: 18,),
        hintStyle: TextStyle(
          fontFamily: Styles.itimFont,
          color: Styles.primary,
          fontWeight: FontWeight.normal,
        ),
        labelText: widget.label,
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
          borderRadius: const BorderRadius.all(Radius.circular(20)),
        ),
        isDense: true,
        errorMaxLines: 2,
      ),
    );
  }
}
