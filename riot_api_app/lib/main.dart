import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:riot_api_app/pages/main_menu_page.dart';

final List<Locale> supportedLocales = [
  const Locale('en'),
  const Locale('fr'),
];

void main() {
  runApp(
    EasyLocalization(
      supportedLocales: supportedLocales,
      path: "assets/lang",
      fallbackLocale: const Locale('en'),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter riot app',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainMenuPage(),
    );
  }
}
