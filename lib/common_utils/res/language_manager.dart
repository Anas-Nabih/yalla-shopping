enum LanguageType { ENGLISH, ARABIC }

extension LanguageTypeExtention on LanguageType {
  String getValue() {
    switch (this) {
      case LanguageType.ARABIC:
        return "ar";
      case LanguageType.ENGLISH:
        return "en";
    }
  }
}
