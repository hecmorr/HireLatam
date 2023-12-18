part of 'weather_bloc.dart';

sealed class WeatherBlocEvent extends Equatable {
  const WeatherBlocEvent();

  @override
  List<Object> get props => [];
}

class FetchWeather extends WeatherBlocEvent {
  //Request the persmission
  final Position position;

  const FetchWeather({required this.position});

  @override
  List<Object> get props => [position];
}
