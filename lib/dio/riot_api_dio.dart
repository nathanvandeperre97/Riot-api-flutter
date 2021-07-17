import 'package:riot_api_flutter/classes/summoner_dto.dart';

class RiotApiDao {
  Future<SummonerDto> getSummonerDto(String summonerName) {
    return Future.value(SummonerDto(
        accountId: "1",
        profileIconId: 1,
        revisionDate: 1,
        name: "1",
        id: "1",
        puuid: "1",
        summonerLevel: 1));
  }
}
