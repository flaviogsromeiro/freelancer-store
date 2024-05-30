import 'package:flutter/material.dart';
import 'package:my_store/src/utils/style/styles.dart';

mixin FormFieldMixin {
  /// Variável booleana que indica o status se há ou não texto do TextField.
  bool _isContainsText = false;
  final FocusNode _focusNode = FocusNode();
  Color _iconColor = Colors.grey;

  FocusNode get focusNode => _focusNode;

  Color get iconColor => _iconColor;

  /// Getter que retorna a variável [_isContainsText] indicando
  /// o status do conteúdo.
  bool get isContainsText => _isContainsText;

  /// Variável booleana que indica o status se esconde o texto ou não.
  bool _isShowPassword = true;

  /// Getter que retorna a variável [_isShowPassword] indicando
  /// o status se esconde o texto ou não.
  bool get isShowPassword => _isShowPassword;

  /// Método que verifica se no TextField existe texto ou não e
  /// atualiza o status da variável [_isContainsText].
  void updateContentVisibility(String value) {
    if (value.isEmpty) {
      _isContainsText = false;
    } else {
      _isContainsText = true;
    }
  }

  void updateColorFocus() {
    _iconColor = _focusNode.hasFocus ? Styles.primary : Colors.grey;
  }

  IconData get visibilityIcon =>
      _isShowPassword ? Icons.visibility : Icons.visibility_off;

  /// Método que atualiza o status a variável [_isShowPassword] com um
  /// booleano de esconde ou não o texto.
  void toggleVisibility() {
    _isShowPassword = !_isShowPassword;
  }
}
