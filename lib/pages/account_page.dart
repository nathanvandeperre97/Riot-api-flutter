import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:riot_api_flutter/classes/summoner_dto.dart';
import 'package:riot_api_flutter/providers/summoner_dto_provider.dart';
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
    return ChangeNotifierProvider.value(
      value: GetIt.I.get<SummonerDtoProvider>(),
      child: Consumer<SummonerDtoProvider>(
        builder: (context, provider, _) {
          SummonerDto _summonerDto = provider.getSummonerDto();
          if (_summonerDto == null) {
            return searchSummoner(context, provider);
          }
          return printSummoner(context, provider, _summonerDto);
        },
      ),
    );
  }

  Widget searchSummoner(BuildContext context, SummonerDtoProvider provider) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors().backgroundColor,
        title: Text(
          "account_menu_title".tr(),
          style: TextStyle(color: AppColors().textColor),
        ),
      ),
      body: Container(
        color: AppColors().backgroundColor,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(left: 48.0, right: 48.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "summonerName_textfield".tr(),
                  style: TextStyle(
                    color: AppColors().textColor,
                    fontSize: 24,
                  ),
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    fillColor: Color(0xfffbc02d),
                    filled: true,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(90.0)),
                        borderSide: BorderSide(color: Color(0xfffbc02d))),
                    contentPadding: EdgeInsets.symmetric(horizontal: 12.0),
                  ),
                  style: const TextStyle(
                    fontSize: 20,
                    color: Color(0xff00838f),
                  ),
                  textInputAction: TextInputAction.done,
                  onFieldSubmitted: (text) {
                    provider.summonerName = text;
                    provider.getSummonerDto();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget printSummoner(BuildContext context, SummonerDtoProvider provider,
      SummonerDto summonerDto) {
    return Scaffold(
      appBar: AppBar(
        actions: [popupMenuButton(provider)],
        backgroundColor: AppColors().backgroundColor,
        title: Text(
          "account_menu_title".tr(),
          style: TextStyle(color: AppColors().textColor),
        ),
      ),
      body: Container(
        color: AppColors().backgroundColor,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(left: 36.0, right: 36.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                printAccountId(summonerDto),
                printAccountPuuid(summonerDto),
                printRevisionDate(summonerDto),
                printProfileIconId(summonerDto),
                printName(summonerDto),
                printSummonerId(summonerDto),
                printSummonerLevel(summonerDto)
              ],
            ),
          ),
        ),
      ),
    );
  }

  Column printAccountId(SummonerDto summonerDto) {
    return Column(
      children: [
        Text("account_id".tr(),
            style: const TextStyle(fontSize: 16, color: Color(0xfffbc02d))),
        Text(summonerDto.accountId,
            style: const TextStyle(fontSize: 16, color: Color(0xfffbc02d)))
      ],
    );
  }

  Column printAccountPuuid(SummonerDto summonerDto) {
    return Column(
      children: [
        Text("puuid".tr(),
            style: const TextStyle(fontSize: 16, color: Color(0xfffbc02d))),
        Text(summonerDto.puuid,
            style: const TextStyle(fontSize: 16, color: Color(0xfffbc02d)))
      ],
    );
  }

  Column printRevisionDate(SummonerDto summonerDto) {
    return Column(
      children: [
        Text("revisionDate".tr(),
            style: const TextStyle(fontSize: 16, color: Color(0xfffbc02d))),
        Text(summonerDto.revisionDate.toString(),
            style: const TextStyle(fontSize: 16, color: Color(0xfffbc02d)))
      ],
    );
  }

  Column printProfileIconId(SummonerDto summonerDto) {
    return Column(
      children: [
        Text("profileIconId".tr(),
            style: const TextStyle(fontSize: 16, color: Color(0xfffbc02d))),
        Text(summonerDto.profileIconId.toString(),
            style: const TextStyle(fontSize: 16, color: Color(0xfffbc02d)))
      ],
    );
  }

  Column printName(SummonerDto summonerDto) {
    return Column(
      children: [
        Text("name".tr(),
            style: const TextStyle(fontSize: 16, color: Color(0xfffbc02d))),
        Text(summonerDto.name,
            style: const TextStyle(fontSize: 16, color: Color(0xfffbc02d)))
      ],
    );
  }

  Column printSummonerId(SummonerDto summonerDto) {
    return Column(
      children: [
        Text("id".tr(),
            style: const TextStyle(fontSize: 16, color: Color(0xfffbc02d))),
        Text(summonerDto.id,
            style: const TextStyle(fontSize: 16, color: Color(0xfffbc02d)))
      ],
    );
  }

  Column printSummonerLevel(SummonerDto summonerDto) {
    return Column(
      children: [
        Text("summonerLevel".tr(),
            style: const TextStyle(fontSize: 16, color: Color(0xfffbc02d))),
        Text(summonerDto.summonerLevel.toString(),
            style: const TextStyle(fontSize: 16, color: Color(0xfffbc02d)))
      ],
    );
  }

  PopupMenuButton<int> popupMenuButton(SummonerDtoProvider provider) {
    return PopupMenuButton<int>(
      itemBuilder: (context) => [
        PopupMenuItem(
          value: 1,
          child: Text("change_summoner_dto".tr()),
        ),
      ],
      icon: Icon(Icons.more_vert, color: Colors.white),
      onSelected: (value) {
        switch (value) {
          case 1:
            provider.changeSummoner();
            break;
        }
      },
    );
  }
}
