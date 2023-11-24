import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/first_page.dart';
import 'package:portfolio/translations/translation.dart';
import 'package:url_strategy/url_strategy.dart';

Future<void> main() async {
  setPathUrlStrategy();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const Main());
}

class Main extends StatelessWidget {
  const Main({super.key});
  @override
  Widget build(BuildContext context) => GetMaterialApp(
        translations: TranslationTemplate(),
        locale: const Locale("en", "US"),
        defaultTransition: Transition.noTransition,
        title: "Hafedh Gunichi",
        debugShowCheckedModeBanner: false,
        home: const Navior(),
      );
}
