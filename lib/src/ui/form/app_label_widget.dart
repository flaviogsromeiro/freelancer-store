import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_store/src/ui/form/validate_form_field.dart';

///
class AppLabelWidget extends StatelessWidget {
  ///Classe que implementa um componente de edição de texto
  const AppLabelWidget({
    required this.label,
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
    this.visible = true,
    super.key,
  });

  ///
  final String label;

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
  final bool visible;

  @override
  Widget build(BuildContext context) {
    // final theme = Theme.of(context);
    if (visible) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(
              top: 16,
            ),
            child: Text(
              label,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(
              top: 5,
            ),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color.fromARGB(255, 35, 114, 173),
                  Color.fromARGB(255, 129, 143, 153),
                ],
              ),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
              border: Border(
                top: BorderSide(
                  color: Colors.white,
                ),
                bottom: BorderSide(
                  color: Colors.white,
                ),
                left: BorderSide(
                  color: Colors.white,
                ), //Borderside
                right: BorderSide(
                  color: Colors.white,
                ),
              ),
            ),
            child: ValidateFormField(
              controller: controller,
              keyboardType: keyboardType,
              maxLength: maxLength,
              textAlign: textAlign,
              textCapitalization: textCapitalization,
              validation: validation,
              maxLines: maxLines,
              moveLabel: moveLabel,
              onChanged: onChanged,
              obscureText: obscureText,
              onObscureTextChanged: onObscureTextChanged,
              showButtonObscureText: showButtonObscureText,
              focusNode: focusNode,
              nextFocus: nextFocus,
              textInputAction: textInputAction,
              autoFocus: autoFocus,
              errorText: errorText,
              icon: icon,
              prefixIcon: prefixIcon,
              inputFormatters: inputFormatters,
              enabled: enabled,
              readOnly: readOnly,
              autoValidateMode: autoValidateMode,
            ),
          ),
        ],
      );
    }
    return const SizedBox.shrink();
  }
}
