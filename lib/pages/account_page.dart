import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:riot_api_flutter/utils/colors.dart';

class AccountPage extends StatefulWidget {
  static const routeName = "/account";

  AccountPage({Key key}) : super(key: key);

  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors().backgroundColor,
        title: Text(
          "account_menu_title".tr(),
          style: TextStyle(color: AppColors().textColor),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [],
        ),
      ),
    );
  }
}
