// ignore_for_file: public_member_api_docs, sort_constructors_first
//
import 'package:flutter/material.dart';
import 'package:my_store/src/utils/style/styles.dart';

class AppDropDownOptions extends StatefulWidget {
  const AppDropDownOptions({
    required this.onSelected,
    required this.onValidator,
    required this.list,
    required this.labelText,
    required this.hint,
    required this.enable,
    super.key,
    this.value,
  });

  final void Function(String?) onSelected;
  final String? Function(String?) onValidator;
  final List<String> list;
  final String labelText;
  final String hint;
  final String? value;
  final bool enable;

  @override
  State<AppDropDownOptions> createState() => _AppDropDownOptionsState();
}

class _AppDropDownOptionsState extends State<AppDropDownOptions> {
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      padding: EdgeInsets.zero,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      disabledHint: Text(
        widget.value ?? '',
        style: TextStyle(fontFamily: Styles.itimFont, color: Styles.primary),
      ),
      validator: widget.onValidator,
      onChanged: widget.onSelected,
      value: widget.value,
      dropdownColor: Colors.white,
      style: TextStyle(
        fontFamily: Styles.itimFont,
        fontSize: 18,
        color: widget.enable ? Colors.black : Colors.grey,
      ),
      decoration: InputDecoration(
        labelText: widget.labelText,
        labelStyle: TextStyle(
          fontFamily: Styles.itimFont,
          fontSize: 18,
          color: Styles.primary,
        ),
        hintText: widget.hint,
        hintStyle: TextStyle(
          fontFamily: Styles.itimFont,
          fontSize: 18,
          color: Styles.primary,
          fontWeight: FontWeight.normal,
        ),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        floatingLabelStyle: TextStyle(
          fontFamily: Styles.itimFont,
          fontSize: 18,
          color: Styles.primary,
        ),
        filled: true,
        fillColor: Colors.transparent,
        contentPadding: const EdgeInsets.all(15),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Styles.primary,
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
        errorMaxLines: 2,
      ),
      items: widget.enable
          ? widget.list.map<DropdownMenuItem<String>>((dynamic value) {
              return DropdownMenuItem<String>(
                enabled: widget.enable,
                value: value.toString(),
                child: Text(value.toString()),
              );
            }).toList()
          : null,
    );
  }
}
