// import 'package:dio/dio.dart';
// import 'package:weather_app/repos/models/weather.dart';

// class WeatherRepository {
//   Future<Weather> getWeather(String location) async {
//     // fetch the weather data from the API
//     final dio = Dio();
//     const apiKey = '45a904db7a5783a4d4e5b3bb65f6dd1c';
//     final response = await dio.get(
//         "https://api.openweathermap.org/data/2.5/weather?q=$location&${apiKey}");
//     if (response.statusCode == 200) {
//       return response.data;
//       // parse the JSON data and return a Weather object
//     } else {
//       throw Exception("Failed to get weather");
//     }
//   }
// }
