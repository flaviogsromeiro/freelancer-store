import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ValidateFormField extends StatelessWidget {
  ///
  const ValidateFormField({
    required this.controller,
    this.keyboardType = TextInputType.text,
    this.maxLength = 0,
    this.textAlign = TextAlign.start,
    this.textCapitalization = TextCapitalization.none,
    this.validation,
    this.maxLines = 1,
    this.moveLabel = false,
    this.onChanged,
    this.obscureText = false,
    this.onObscureTextChanged,
    this.showButtonObscureText = false,
    this.focusNode,
    this.nextFocus,
    this.textInputAction = TextInputAction.unspecified,
    this.autoFocus = true,
    this.errorText,
    this.icon,
    this.prefixIcon,
    this.inputFormatters,
    this.prefixIconColor = Colors.transparent,
    this.enabled = true,
    this.readOnly = false,
    this.autoValidateMode = AutovalidateMode.disabled,
    this.spacing = true,
    this.hintText = '',
    super.key,
  });

  ///
  final TextEditingController controller;

  ///
  final TextInputType keyboardType;

  ///
  final int maxLength;

  ///
  final TextAlign textAlign;

  ///
  final TextCapitalization textCapitalization;

  ///
  final FormFieldValidator<String>? validation;

  ///
  final int maxLines;

  ///
  final bool moveLabel;

  ///
  final ValueChanged<String>? onChanged;

  ///
  final bool obscureText;

  ///
  final VoidCallback? onObscureTextChanged;

  ///
  final bool showButtonObscureText;

  ///
  final FocusNode? focusNode;

  ///
  final FocusNode? nextFocus;

  ///
  final TextInputAction textInputAction;

  ///
  final bool autoFocus;

  ///
  final String? errorText;

  ///
  final IconData? icon;

  ///
  final IconData? prefixIcon;

  ///
  final List<TextInputFormatter>? inputFormatters;

  ///
  final Color prefixIconColor;

  ///
  final bool enabled;

  ///
  final bool readOnly;

  ///
  final AutovalidateMode autoValidateMode;

  ///
  final bool spacing;

  ///
  final String hintText;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return TextFormField(
      readOnly: readOnly,
      autofocus: autoFocus,
      textInputAction: textInputAction,
      focusNode: focusNode,
      onFieldSubmitted: (String text) {
        if (nextFocus != null) {
          FocusScope.of(context).requestFocus(nextFocus);
        }
      },
      enabled: enabled,
      onChanged: onChanged,
      autovalidateMode: autoValidateMode,
      controller: controller,
      keyboardType: keyboardType,
      maxLength: maxLength > 0 ? maxLength : null,
      textAlign: textAlign,
      textCapitalization: textCapitalization,
      validator: validation,
      obscureText: obscureText,
      maxLines: maxLines,
      inputFormatters: inputFormatters,
      style: const TextStyle(
        color: Colors.white,
      ),
      decoration: InputDecoration(
        floatingLabelBehavior: moveLabel
            ? FloatingLabelBehavior.auto
            : FloatingLabelBehavior.never,
        hintText: hintText,
        labelText: hintText,
        errorText: errorText,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: theme.focusColor,
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(
              12,
            ),
          ),
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.red,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(
              12,
            ),
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: theme.disabledColor,
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(
              12,
            ),
          ),
        ),
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.red,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(
              12,
            ),
          ),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.transparent,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(
              12,
            ),
          ),
        ),
        errorStyle: const TextStyle(
          fontSize: 13,
          color: Colors.red,
        ),
        floatingLabelStyle: theme.inputDecorationTheme.floatingLabelStyle,
        hintStyle: theme.inputDecorationTheme.hintStyle,
        // labelStyle: const TextStyle(
        //   color: Colors.transparent,
        // ),
        filled: true,
        fillColor: Colors.transparent,
        alignLabelWithHint: false,
        contentPadding: const EdgeInsets.fromLTRB(10, 8, 10, 8),
        border: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.transparent,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(
              12,
            ),
          ),
        ),
        prefixIcon: prefixIcon != null
            ? Icon(
                prefixIcon,
                color: prefixIconColor,
              )
            : null,
        suffix: spacing
            ? !showButtonObscureText
                ? Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                    ),
                    child: Icon(
                      icon,
                      //color: customColor.sourceInputFocusColor,
                      size: 19,
                    ),
                  )
                : IconButton(
                    padding: const EdgeInsets.only(
                      left: 10,
                      right: 10,
                    ),
                    iconSize: 13,
                    onPressed: onObscureTextChanged,
                    visualDensity:
                        const VisualDensity(horizontal: -4, vertical: -4),
                    icon: Icon(
                      obscureText ? Icons.visibility : Icons.visibility_off,
                      //color: customColor.sourceInputFocusColor,
                      size: 13,
                    ),
                  )
            : null,
      ),
    );
  }
}
