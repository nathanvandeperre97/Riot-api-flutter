class Config {
  String apiKey;

  Config({this.apiKey = ''});

  Config.fromJson(Map<String, dynamic> json)
      : apiKey = json['api_key'] as String;

  Map<String, dynamic> toJson() => {'api_key': apiKey};
}
