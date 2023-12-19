part of 'weather_city_bloc.dart';

sealed class WeatherCityEvent extends Equatable {
  const WeatherCityEvent();

  @override
  List<Object> get props => [];
}

class GetWeather extends WeatherCityEvent {
  final String location;
  const GetWeather({required this.location});
}
