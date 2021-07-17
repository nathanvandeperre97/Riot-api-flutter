import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:riot_api_flutter/classes/summoner_dto.dart';
import 'package:riot_api_flutter/services/summoner_dto_service.dart';

class SummonerDtoProvider with ChangeNotifier {
  final _summonerDtoService = GetIt.I.get<SummonerDtoService>();
  String summonerName;

  SummonerDto getSummonerDto() {
    if (summonerName != null) {
      SummonerDto summonerDto = _summonerDtoService.getSummonerDto();

      if (summonerDto == null) {
        _summonerDtoService
            .fetchSummonerDto(summonerName)
            .whenComplete(() => notifyListeners());
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
}
