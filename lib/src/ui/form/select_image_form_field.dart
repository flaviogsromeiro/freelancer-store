import 'dart:io';

import 'package:flutter/material.dart';

class SelectImageFormField extends FormField<List<File>> {
  SelectImageFormField({
    required String label,
    required ThemeData theme,
    required VoidCallback onCamera,
    required VoidCallback onGaleria,
    super.onSaved,
    super.validator,
    super.enabled,
    super.autovalidateMode = AutovalidateMode.onUserInteraction,
    bool autofocus = false,
    List<File> initialValue = const [],
    FocusNode? focusNode,
    bool visible = true,
    super.key,
  }) : super(
          initialValue: initialValue,
          builder: (FormFieldState<List<File>> state) {
            if (visible) {
              return Focus(
                autofocus: autofocus,
                focusNode: focusNode ?? FocusNode(),
                child: Builder(
                  builder: (context) {
                    final focusNode = Focus.of(context);
                    final hasFocus = focusNode.hasFocus;
                    var borderColor = Colors.transparent;
                    if (state.hasError) {
                      borderColor = Colors.red;
                    } else if (hasFocus) {
                      borderColor = Colors.green;
                    }
                    return GestureDetector(
                      onTap: () {
                        if (!hasFocus) {
                          focusNode.requestFocus();
                        }
                        showModalBottomSheet<void>(
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(15),
                            ),
                          ),
                          context: context,
                          builder: (context) {
                            return Padding(
                              padding: const EdgeInsets.all(8),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  ListTile(
                                    leading: const Icon(
                                      Icons.photo_camera,
                                    ),
                                    title: const Text(
                                      'Câmera',
                                      style: TextStyle(
                                        fontSize: 20,
                                      ),
                                    ),
                                    onTap: () {
                                      onCamera.call();
                                      Navigator.pop(context);
                                    },
                                  ),
                                  ListTile(
                                    leading: const Icon(
                                      Icons.photo_library,
                                    ),
                                    title: const Text(
                                      'Galeria',
                                      style: TextStyle(
                                        fontSize: 20,
                                      ),
                                    ),
                                    onTap: () {
                                      onGaleria.call();
                                      Navigator.pop(context);
                                    },
                                  ),
                                  ListTile(
                                    leading: const Icon(Icons.close),
                                    title: const Text(
                                      'Cancelar',
                                      style: TextStyle(
                                        fontSize: 20,
                                      ),
                                    ),
                                    onTap: () => Navigator.pop(context),
                                  ),
                                ],
                              ),
                            );
                          },
                        );
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
                                    fontSize: 16,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            margin: EdgeInsets.only(
                              top: 5,
                              bottom: state.hasError ? 0 : 16,
                            ),
                            padding: const EdgeInsets.only(
                              top: 5,
                              bottom: 5,
                              left: 2,
                            ),
                            height: 50,
                            decoration: BoxDecoration(
                              color: theme.colorScheme.background,
                              border: Border.all(
                                color: borderColor,
                              ),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(
                                  10,
                                ),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  '',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Ink(
                                  decoration: const ShapeDecoration(
                                    color: Colors.white,
                                    shape: CircleBorder(),
                                  ),
                                  child: const SizedBox(
                                    height: 100,
                                    child:
                                        // IconButton(
                                        //   onPressed: () {

                                        //   },
                                        //   icon:
                                        Icon(
                                      Icons.add_a_photo,
                                      color: Colors.white,
                                    ),
                                    // ),
                                  ),
                                ),
                              ],
                            ),

                            // Row(
                            //   mainAxisAlignment: MainAxisAlignment.center,
                            //   children: [
                            //     Container(
                            //       margin: const EdgeInsets.only(
                            //         left: 8,
                            //       ),
                            //       child: const Icon(
                            //         Icons.camera,
                            //         size: 20,
                            //       ),
                            //     ),
                            //     const Expanded(
                            //       flex: 85,
                            //       child: Text(
                            //         'ITEM',
                            //         //state.value ?? '',
                            //       ),
                            //     ),
                            //   ],
                            // ),
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
}
