// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:my_store/src/utils/style/styles.dart';
import 'package:my_store/src/utils/utils.dart';

class AppRadioOptionsDropDown extends StatefulWidget {
  const AppRadioOptionsDropDown({
    required this.listOfRadio,
    required this.listOfValuesDropDown,
    required this.label,
    required this.enable,
    super.key,
    this.onValidator,
    this.onChanged,
    this.onRadioChanged,
    this.value,
    this.indexRadio,
  });

  final List<String> listOfRadio;
  final List<String> listOfValuesDropDown;
  final String? Function(dynamic)? onValidator;
  final void Function(String?)? onChanged;
  final void Function(int)? onRadioChanged;
  final String? value;
  final String label;
  final int? indexRadio;
  final bool enable;

  @override
  State<AppRadioOptionsDropDown> createState() =>
      _AppRadioOptionsDropDownState();
}

class _AppRadioOptionsDropDownState extends State<AppRadioOptionsDropDown> {
  int? selectKey;
  String? loadText;

  @override
  void initState() {
    super.initState();
    selectKey = widget.indexRadio;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(
            bottom: 17,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: widget.listOfRadio.map((entry) {
              final key = widget.listOfRadio.indexOf(entry);
              final value = entry;

              return Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Radio<int>(
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    visualDensity: VisualDensity.compact,
                    value: key,
                    mouseCursor: MouseCursor.uncontrolled,
                    groupValue: selectKey,
                    activeColor: Styles.primary,
                    onChanged: (newValue) {
                      setState(() {
                        selectKey = newValue ?? 0;

                        if (widget.onRadioChanged != null) {
                          widget.onRadioChanged!.call(newValue!);
                        }
                      });
                    },
                  ),
                  Text(
                    value,
                    textAlign: TextAlign.start,
                  ),
                ],
              );
            }).toList(),
          ),
        ),
        Padding(
          padding:
              EdgeInsets.symmetric(vertical: Utils.heightSize(context) * 0.01),
          child: DropdownButtonFormField(
            padding: EdgeInsets.zero,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: widget.onValidator,
            onChanged: widget.onChanged,
            value: widget.value,
            dropdownColor: Colors.white,
            style: TextStyle(
              color: widget.enable ? Colors.black : Colors.grey,
            ),
            decoration: InputDecoration(
              labelText: widget.label,
              labelStyle: TextStyle(
                color: !widget.enable ? Colors.grey : null,
              ),
              hintText: 'Selecione',
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              hintStyle: const TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.normal,
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
                ? widget.listOfValuesDropDown
                    .map<DropdownMenuItem<String>>((dynamic value) {
                    return DropdownMenuItem<String>(
                      enabled: widget.enable,
                      value: value.toString(),
                      child: Text(value.toString()),
                    );
                  }).toList()
                : null,
          ),
        ),
      ],
    );
  }
}
