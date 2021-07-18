class SummonerDto {
  String accountId;
  int profileIconId;
  int revisionDate;
  String name;
  String id;
  String puuid;
  int summonerLevel;
  int statusCode;

  SummonerDto(
      {this.accountId,
      this.profileIconId,
      this.revisionDate,
      this.name,
      this.id,
      this.puuid,
      this.summonerLevel,
      this.statusCode});
}
