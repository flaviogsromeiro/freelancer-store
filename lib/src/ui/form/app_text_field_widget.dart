// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:flutter/services.dart';
=======
>>>>>>> 1db866af64af248d274dabceb92a1877ec081436
import 'package:my_store/src/core/mixin/form_field_mixin.dart';
import 'package:my_store/src/utils/style/styles.dart';

class AppTextFieldWidget extends StatefulWidget {
  AppTextFieldWidget({
    required this.hintText,
    required this.validator,
    required this.controller,
    this.labelText = '',
    this.suffixIcon,
    this.prefixIcon,
    this.suffixAction,
    this.onChanged,
<<<<<<< HEAD
    this.inputFormatters,
    this.textInputType,
=======
>>>>>>> 1db866af64af248d274dabceb92a1877ec081436
    this.isShowIconPassword = false,
    super.key,
  });

  IconData? prefixIcon;
  IconData? suffixIcon;
  bool isShowIconPassword;
  VoidCallback? suffixAction;
  final String hintText;
  String labelText;
  final String? Function(String?) validator;
  void Function(String?)? onChanged;
  final TextEditingController controller;
<<<<<<< HEAD
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? textInputType;
=======
>>>>>>> 1db866af64af248d274dabceb92a1877ec081436

  @override
  State<AppTextFieldWidget> createState() => _AppTextFieldWidgetState();
}

class _AppTextFieldWidgetState extends State<AppTextFieldWidget>
    with FormFieldMixin {
  bool _isShowIconTap = false;

  @override
  void initState() {
    super.initState();

    focusNode.addListener(() {
      setState(
        updateColorFocus,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 5, bottom: 5),
          child: Text(
            widget.labelText,
            style: Styles.labelFieldStyle,
          ),
        ),
        TextFormField(
<<<<<<< HEAD
          inputFormatters: widget.inputFormatters,
          textCapitalization: TextCapitalization.sentences,
          keyboardType: widget.textInputType,
=======
>>>>>>> 1db866af64af248d274dabceb92a1877ec081436
          cursorColor: Styles.primary,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          focusNode: focusNode,
          onTap: () => _onContentFocusedText(widget.controller),
          obscureText: widget.isShowIconPassword
              ? isShowPassword
              : widget.isShowIconPassword,
          controller: widget.controller,
          onChanged: widget.onChanged ??
              (value) {
                updateContentVisibility(value);
                setState(() => _isShowIconTap = isContainsText);
              },
          validator: widget.validator,
          decoration: InputDecoration(
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            filled: true,
            fillColor: Colors.transparent,
            hintText: widget.hintText,
            contentPadding: const EdgeInsets.all(15),
            hintStyle:
                const TextStyle(fontWeight: FontWeight.normal, fontSize: 18),
            prefixIcon: Icon(
              widget.prefixIcon,
              color: iconColor,
            ),
            suffixIcon:
                widget.isShowIconPassword && _isShowIconTap && isContainsText
                    ? IconButton(
                        splashRadius: 2,
                        onPressed: widget.suffixAction ?? _isVisibilityPassword,
                        icon: Icon(
                          widget.suffixIcon ?? visibilityIcon,
                          color: iconColor,
                        ),
                      )
                    : null,
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
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.grey,
              ),
              gapPadding: 25,
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
          ),
        ),
      ],
    );
  }

  void _isVisibilityPassword() {
    setState(toggleVisibility);
  }

  void _onContentFocusedText(TextEditingController controller) {
    setState(() {
      _isShowIconTap = controller.text.isNotEmpty;
    });
  }
}
