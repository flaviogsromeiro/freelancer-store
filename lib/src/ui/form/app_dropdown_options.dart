// ignore_for_file: public_member_api_docs, sort_constructors_first
//
import 'package:flutter/material.dart';

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
      disabledHint: Text(widget.value ?? ''),
      validator: widget.onValidator,
      onChanged: widget.onSelected,
      value: widget.value,
      dropdownColor: Colors.white,
      style: TextStyle(
        color: widget.enable ? Colors.black : Colors.grey,
      ),
      decoration: InputDecoration(
        labelText: widget.labelText,
        labelStyle: TextStyle(
          color: !widget.enable ? Colors.grey : null,
        ),
        hintText: widget.hint,
        hintStyle: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.normal,
        ),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        floatingLabelStyle: const TextStyle(color: Colors.grey),
        filled: true,
        fillColor: Colors.transparent,
        contentPadding: const EdgeInsets.all(15),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey,
          ),
          borderRadius: BorderRadius.all(Radius.circular(20)),
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
          // gapPadding: 25,
          borderRadius: BorderRadius.all(Radius.circular(20)),
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
