import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:riot_api_flutter/pages/account_page.dart';
import 'package:riot_api_flutter/pages/main_menu_page.dart';

void initServices() {}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  initServices();

  final List<Locale> supportedLocales = [
    const Locale('en'),
    const Locale('fr'),
  ];

  runApp(
    EasyLocalization(
      supportedLocales: supportedLocales,
      path: "assets/translations",
      fallbackLocale: const Locale('en'),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      title: 'Flutter riot app',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: MainMenuPage.routeName,
      routes: {
        MainMenuPage.routeName: (context) => MainMenuPage(),
        AccountPage.routeName: (context) => AccountPage(),
      },
    );
  }
}
