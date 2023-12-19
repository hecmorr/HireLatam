part of 'weather_bloc.dart';

sealed class WeatherBlocEvent extends Equatable {
  const WeatherBlocEvent();

  @override
  List<Object> get props => [];
}

class WeatherFetched extends WeatherBlocEvent {
  final Position position;
  const WeatherFetched({required this.position});

  @override
  List<Object> get props => [position];
}

class WeatherCityNameFetched extends WeatherBlocEvent {
  final String cityName;
  const WeatherCityNameFetched({required this.cityName});

  @override
  List<Object> get props => [cityName];
}
