import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'weather_city_event.dart';
part 'weather_city_state.dart';

class WeatherCityBloc extends Bloc<WeatherCityEvent, WeatherCityState> {
  WeatherCityBloc() : super(WeatherCityInitial()) {
    on<WeatherCityEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
