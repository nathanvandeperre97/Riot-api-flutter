import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:riot_api_flutter/classes/summoner_dto.dart';
import 'package:http/http.dart' as http;
import 'package:riot_api_flutter/utils/config.dart';

class RiotApiDao {
  final String url = "https://euw1.api.riotgames.com";

  Future<SummonerDto> getSummonerDto(String summonerName) async {
    final String json =
        await rootBundle.loadString("assets/config/config.json");
    final Config decodedJson =
        Config.fromJson(jsonDecode(json) as Map<String, dynamic>);
    final String token = decodedJson.apiKey;

    var requestUrl = Uri.parse(
        '${this.url}/lol/summoner/v4/summoners/by-name/$summonerName');
    var response = await http.get(requestUrl, headers: {"X-Riot-Token": token});
    var body = jsonDecode(response.body) as Map<String, dynamic>;

    return Future.value(SummonerDto(
        accountId: body["accountId"],
        profileIconId: body["profileIconId"],
        revisionDate: body["revisionDate"],
        name: body["name"],
        id: body["id"],
        puuid: body["puuid"],
        summonerLevel: body["summonerLevel"]));
  }
}
