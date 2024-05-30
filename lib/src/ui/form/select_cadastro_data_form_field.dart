import 'package:flutter/material.dart';

import 'package:intl/intl.dart';

class SelectCadastroDataFormField extends FormField<String> {
  //

  ///
  SelectCadastroDataFormField({
    required String label,
    required this.controller,
    super.onSaved,
    super.validator,
    super.enabled,
    super.autovalidateMode = AutovalidateMode.onUserInteraction,
    bool autofocus = false,
    String initialValue = '',
    FocusNode? focusNode,
    bool visible = true,
    super.key,
  }) : super(
          initialValue: initialValue,
          builder: (FormFieldState<String> state) {
            if (visible) {
              return Focus(
                autofocus: autofocus,
                focusNode: focusNode ?? FocusNode(),
                child: Builder(
                  builder: (context) {
                    return GestureDetector(
                      onTap: () async {
                        final date = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(DateTime.now().year),
                          lastDate: DateTime(DateTime.now().year, 12, 31),
                          locale: const Locale('pt', 'BR'),
                        );
                        if (date != null) {
                          controller.text =
                              DateFormat('dd-MM-yyyy', 'pt_Br').format(date);
                          state.reset();
                        }
                      },
                      child: Column(
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
                            padding: const EdgeInsets.symmetric(
                              horizontal: 24,
                            ),
                            height: 48,
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Color.fromARGB(255, 225, 230, 235),
                                  Color(0xff598AB0),
                                ],
                              ),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10),
                                bottomLeft: Radius.circular(10),
                                bottomRight: Radius.circular(10),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  textAlign: TextAlign.right,
                                  controller.text,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Ink(
                                  child: const SizedBox(
                                    height: 100,
                                    child: Icon(
                                      Icons.date_range,
                                      color: Colors.white,
                                    ),
                                    // ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          if (state.hasError)
                            Container(
                              margin: const EdgeInsets.only(
                                left: 8,
                                top: 8,
                                bottom: 16,
                              ),
                              child: Text(
                                state.errorText ?? 'Não informado',
                                textAlign: TextAlign.start,
                                style: const TextStyle(
                                  fontSize: 13,
                                  color: Colors.red,
                                ),
                              ),
                            ),
                        ],
                      ),
                    );
                  },
                ),
              );
            }
            return const SizedBox.shrink();
          },
        );
  final TextEditingController controller;
}
