import 'package:get_it/get_it.dart';
import 'package:riot_api_flutter/classes/summoner_dto.dart';
import 'package:riot_api_flutter/dio/riot_api_dio.dart';

class SummonerDtoService {
  final _riotApiDao = GetIt.I.get<RiotApiDao>();
  SummonerDto _summonerDto;

  SummonerDto getSummonerDto() {
    return _summonerDto;
  }

  Future<SummonerDto> fetchSummonerDto(String summonerName) async {
    _summonerDto = await _riotApiDao.getSummonerDto(summonerName);
    return _summonerDto;
  }

  void changeSummoner() {
    _summonerDto = null;
  }
}
