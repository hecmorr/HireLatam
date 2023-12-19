class WeatherData {
  WeatherData(
      {required this.temperature,
      required this.description,
      required this.location,
      required this.code});

  factory WeatherData.fromJson(Map<String, dynamic> json) {
    final location = json['sys']['name'] as String;
    final code = json['weather'][0]['id'] as int;
    final description = json['weather'][0]['description'] as String;
    final temperature = json['main']['temp'] as double;

    return WeatherData(
        temperature: temperature,
        description: description,
        location: location,
        code: code);
  }

  final double temperature;
  final String description;
  final String location;
  final int code;
}
