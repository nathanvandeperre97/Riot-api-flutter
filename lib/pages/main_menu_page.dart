import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:riot_api_flutter/utils/colors.dart';

class MainMenuPage extends StatefulWidget {
  static const routeName = "/main_menu";

  MainMenuPage({Key key}) : super(key: key);

  @override
  _MainMenuPageState createState() => _MainMenuPageState();
}

class _MainMenuPageState extends State<MainMenuPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors().backgroundColor,
        title: Text(
          "main_menu_title".tr(),
          style: TextStyle(color: AppColors().textColor),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: _menuButtons(),
        ),
      ),
    );
  }

  List<Widget> _menuButtons() {
    return [
      ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
          primary: AppColors().backgroundColor,
        ),
        onPressed: () => Navigator.of(context).pushNamed("/account"),
        child: Text(
          "account_menu_button".tr(),
          style: TextStyle(
            color: AppColors().textColor,
            fontSize: 12,
          ),
        ),
      ),
    ];
  }
}
