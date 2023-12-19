import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/feature/weather_by_city/models/weather_data.dart';

part 'weather_city_event.dart';
part 'weather_city_state.dart';

class WeatherCityBloc extends Bloc<WeatherCityEvent, WeatherCityState> {
  WeatherCityBloc() : super(WeatherCityInitial()) {
    emit(WeatherCityLoading());
    on<GetWeather>((event, emit) {
      try {
        final WeatherRepository weatherApi = WeatherRepository();
        final response = weatherApi.getWeather('Managua');
        print('This is the response: $response');

        emit(WeatherCitySuccess());
      } catch (e) {
        emit(WeatherCityFailed());
      }
    });
  }
}
