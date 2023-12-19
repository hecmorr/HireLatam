import 'package:dio/dio.dart';
import 'package:weather_app/feature/weather_by_city/models/weather.dart';

class WeatherRepository {
  Future<WeatherData> getWeather(String location) async {
    // fetch the weather data from the API
    final dio = Dio();
    final response = await dio
        .get<Map<String, dynamic>>("http://localhost:3000/?city=$location");
    if (response.statusCode == 200) {
      print('This is the response: ${response.data}');
      return WeatherData.fromJson(response.data!);
      // parse the JSON data and return a Weather object
    } else {
      throw Exception("Failed to get weather");
    }
  }
}
