List<LanguageConstant> langList = [Khmer(), LanguageConstant()];

class LanguageConstant {
  String get home => "Home";
  String get theme => "Theme";
  String get systemMode => "System Mode";
  String get darkMode => "Dark Mode";
  String get lightMode => "Light Mode";
  String get language => "Language";
  String get toKhmer => "Change to Khmer";
  String get toEnglish => "Change To English";
  String get toChinese => "Change to Chinese";
}

class Khmer implements LanguageConstant {
  String get home => "ទំព័រដើម";
  String get theme => "ពន្លឺ";
  String get systemMode => "ប្ដូរពន្លឺតាមប្រព័ន្ធ";
  String get darkMode => "ប្ដូរទៅងងឹត";
  String get lightMode => "ប្ដូរទៅពន្លឺ";
  String get language => "ភាសា";
  String get toKhmer => "ប្ដូរទៅភាសាខ្មែរ";
  String get toEnglish => "ប្ដូរទៅអង់គ្លេស";
  String get toChinese => "ប្ដូរទៅចិន";
}

