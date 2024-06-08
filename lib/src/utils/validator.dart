class Validator {
  static String? validateField(String? value, String messageError) {
    if (value == null || value.isEmpty) {
      return messageError;
    }
    return null;
  }
}
