extension ParserExtensionBool on bool {
  String? getBoolStatus() {
    switch (this) {
      case true:
        return 'S';
      case false:
        return 'N';
      default:
        return null;
    }
  }

  
}
