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
    final response = await _riotApiDao.getSummonerDto(summonerName);
    if (response.statusCode == 200) {
      _summonerDto = response;
    }
    return response;
  }

  void changeSummoner() {
    _summonerDto = null;
  }
}
