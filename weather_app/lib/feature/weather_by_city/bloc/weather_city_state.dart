part of 'weather_city_bloc.dart';

sealed class WeatherCityState extends Equatable {
  const WeatherCityState();

  @override
  List<Object> get props => [];
}

final class WeatherCityInitial extends WeatherCityState {}

final class WeatherCityLoading extends WeatherCityState {}

final class WeatherCitySuccess extends WeatherCityState {}

final class WeatherCityFailed extends WeatherCityState {}
