List<LanguageConstant> langList = [Khmer(), LanguageConstant()];

class LanguageConstant {
  String get home => "Home";
  String get theme => "Theme";
  String get darkMode => "Dark Mode";
  String get lightMode => "Light Mode";
  String get language => "Language";
  String get toKhmer => "Change to Khmer";
  String get toEnglish => "Change To English";
  String get search => "Search";
  String get aboutUs => "About us";
}

class Khmer implements LanguageConstant {
  String get home => "ទំព័រដើម";
  String get theme => "ពន្លឺ";
  String get darkMode => "ប្ដូរទៅងងឹត";
  String get lightMode => "ប្ដូរទៅពន្លឺ";
  String get language => "ភាសា";
  String get toKhmer => "ប្ដូរទៅភាសាខ្មែរ";
  String get toEnglish => "ប្ដូរទៅអង់គ្លេស";
  String get search => "ស្វែងរក";
  String get aboutUs => "អំពីយើង";
}

