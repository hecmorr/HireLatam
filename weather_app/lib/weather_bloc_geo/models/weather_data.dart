import 'package:dio/dio.dart';
import 'package:weather_app/weather_bloc_geo/models/weather.dart';

class WeatherRepository {
  Future<WeatherData> getWeather(String location) async {
    // fetch the weather data from the API
    final dio = Dio();
    final response = await dio
        .get<Map<String, dynamic>>("http://localhost:3000/?city=$location");
    if (response.statusCode == 200) {
      return WeatherData.fromJson(response.data!);
      // parse the JSON data and return a Weather object
    } else {
      throw Exception("Failed to get weather");
    }
  }

  Future<WeatherData> getWeatherByCoor(double lat, double lon) async {
    // fetch the weather data from the API
    final dio = Dio();
    final response = await dio
        .get<Map<String, dynamic>>("http://localhost:3000/?lat=$lat&lon=$lon");
    if (response.statusCode == 200) {
      return WeatherData.fromJson(response.data!);
      // parse the JSON data and return a Weather object
    } else if (response.statusCode == 500) {
      throw Exception("The name of the city was not introduced properly");
    } else {
      throw Exception("Failed to get weather");
    }
  }
}
