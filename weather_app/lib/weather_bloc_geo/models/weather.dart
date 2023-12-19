class WeatherData {
  factory WeatherData.fromJson(Map<String, dynamic> json) {
    final location = json['areaName'] as String;
    final timezone = json['time'] as int;
    final code = json['weatherConditionCode'] as int;
    final description = json['weatherMain'] as String;
    final temperature = json['temperature'] as double;

    return WeatherData(
        temperature: temperature,
        timezone: timezone,
        weatherMain: description,
        areaName: location,
        weatherConditionCode: code);
  }

  final double temperature;
  final String weatherMain;
  final int timezone;
  final String areaName;
  final int weatherConditionCode;

  WeatherData(
      {required this.temperature,
      required this.timezone,
      required this.weatherMain,
      required this.areaName,
      required this.weatherConditionCode});
}
