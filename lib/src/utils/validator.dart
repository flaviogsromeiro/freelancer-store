import 'package:my_store/src/core/extensions/parser_extension_string.dart';

class Validator {
  static String? validateEmail(String? value) {
    const Pattern pattern =
        r'^[a-zA-Z_.+-]+\.+[a-zA-Z_.+-]+@afixcode\.com\.br$';

    final emailRegex = RegExp(
      pattern as String,
    );

    if (value != null && emailRegex.hasMatch(value)) {
      return null;
    } else {
      return 'Por favor, informe um e-mail válido';
    }
  }

  static String? validateVehiclePlate(String? value) {
    const Pattern pattern = r'^[a-zA-Z]{3}-[0-9][A-Za-z0-9][0-9]{2}$';

    final vehiclePlateRegex = RegExp(
      pattern as String,
    );

    if (value != null && vehiclePlateRegex.hasMatch(value)) {
      return null;
    } else {
      return 'Placa inválida';
    }
  }

  static String? validateField(String? value, String messageError) {
    if (value == null || value.isEmpty) {
      return messageError;
    }
    return null;
  }

  static String? validateNewPassword(
    String newPassword,
    String confirmedPassword,
  ) {
    if (newPassword.trim() == confirmedPassword.trim()) {
      return null;
    } else {
      return 'Senhas não coincidem. Verifique os campos';
    }
  }

  static String? validateKilometer({
    String? kmStartGoing,
    String? kmEndGoing,
    String? kmStartReturn,
    String? kmEndReturn,
  }) {
    final kmStartGoingParser = kmStartGoing?.convertToInt();
    final kmEndGoingParser = kmEndGoing?.convertToInt();
    final kmStartReturnParser = kmStartReturn?.convertToInt();
    final kmEndReturnParser = kmEndReturn?.convertToInt();

    // Validação da ida
    if (kmStartGoingParser != null && kmEndGoingParser != null) {
      if (kmStartGoingParser > kmEndGoingParser) {
        return 'Km inválida';
      }
    }

    // Validação do retorno
    if (kmStartReturnParser != null && kmEndReturnParser != null) {
      if (kmStartReturnParser > kmEndReturnParser) {
        return 'Km inválida';
      }
    }

    // Verificação entre ida e retorno (opcional dependendo do contexto)
    if (kmEndGoingParser != null && kmStartReturnParser != null) {
      if (kmEndGoingParser > kmStartReturnParser) {
        return 'Km inválida';
      }
    }

    return null;
  }
}
