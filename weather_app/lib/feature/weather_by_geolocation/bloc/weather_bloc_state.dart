part of 'weather_bloc.dart';

sealed class WeatherBlocState extends Equatable {
  const WeatherBlocState();

  @override
  List<Object> get props => [];
}

final class WeatherBlocInitial extends WeatherBlocState {}

final class WeatherLoading extends WeatherBlocState {}

final class WeatherFailure extends WeatherBlocState {}

final class WeatherSuccess extends WeatherBlocState {
  //Weather parameter that is going to feed the ui
  final Weather weather;
  const WeatherSuccess({required this.weather});
  @override
  List<Object> get props => [weather];
}
