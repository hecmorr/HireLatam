import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/weather_bloc_geo/models/weather.dart';

import '../models/weather_data.dart';

part 'weather_bloc_event.dart';
part 'weather_bloc_state.dart';

class WeatherBloc extends Bloc<WeatherBlocEvent, WeatherBlocState> {
  WeatherBloc() : super(WeatherBlocInitial()) {
    on<WeatherFetched>(_onWeatherFetched);
    on<WeatherCityNameFetched>(_onWeatherCityNameFetched);
  }

  Future<void> _onWeatherFetched(
    WeatherFetched event,
    Emitter<WeatherBlocState> emit,
  ) async {
    emit(WeatherLoading());
    try {
      final WeatherRepository weatherApi = WeatherRepository();
      final response = await weatherApi.getWeatherByCoor(
          event.position.latitude, event.position.longitude);
      emit(WeatherSuccess(weather: response));
    } catch (e) {
      emit(WeatherFailure());
    }
  }

  Future<void> _onWeatherCityNameFetched(
      WeatherCityNameFetched event, Emitter<WeatherBlocState> emit) async {
    emit(WeatherLoading());
    try {
      final WeatherRepository weatherApi = WeatherRepository();
      final response = await weatherApi.getWeather(event.cityName);
      emit(WeatherSuccess(weather: response));
    } catch (e) {
      const AlertDialog(
        content: Text('The name of the city was not introduced properly'),
      );
      emit(WeatherFailure());
    }
  }
}
