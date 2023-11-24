import 'package:get/get.dart';
import 'package:portfolio/translations/en.dart';
import 'package:portfolio/translations/fr.dart';

class TranslationTemplate extends Translations {
  @override
  Map<String, Map<String, String>> get keys => <String, Map<String, String>>{"fr_FR": fr, "en_US": en};
}
