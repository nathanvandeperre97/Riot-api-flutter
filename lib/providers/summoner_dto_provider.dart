import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get_it/get_it.dart';
import 'package:riot_api_flutter/classes/summoner_dto.dart';
import 'package:riot_api_flutter/services/summoner_dto_service.dart';
import 'package:easy_localization/easy_localization.dart';

class SummonerDtoProvider with ChangeNotifier {
  final _summonerDtoService = GetIt.I.get<SummonerDtoService>();
  String summonerName;

  SummonerDto getSummonerDto() {
    if (summonerName != null) {
      SummonerDto summonerDto = _summonerDtoService.getSummonerDto();

      if (summonerDto == null) {
        _summonerDtoService.fetchSummonerDto(summonerName).then((response) {
          if (response.statusCode != 200) {
            handleErrors(response.statusCode);
          }
          notifyListeners();
        });
      }

      return summonerDto;
    }
    return null;
  }

  void changeSummoner() {
    summonerName = null;
    _summonerDtoService.changeSummoner();
    notifyListeners();
  }

  void handleErrors(int statusCode) {
    switch (statusCode) {
      case 404:
        Fluttertoast.showToast(msg: "unexistant_summoner".tr());
        break;
      default:
        Fluttertoast.showToast(msg: "global_error".tr());
    }
    summonerName = null;
  }
}
