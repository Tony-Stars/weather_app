import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/weather.dart';
import 'package:weather_app/weather_repository.dart';

abstract class WeatherState {
  const WeatherState();
}

class EmptyWeatherState extends WeatherState {}

class SuccessWeatherState extends WeatherState {
  final Weather weather;

  const SuccessWeatherState({required this.weather}) : super();
}

class ErrorWeatherState extends WeatherState {
  final Exception exception;

  const ErrorWeatherState({required this.exception}) : super();
}

class WeatherCubit extends Cubit<WeatherState> {
  final _weatherRepository = WeatherRepository();

  WeatherCubit() : super(EmptyWeatherState());

  Future<void> getWeatherByCityName(String cityName) async {
    try {
      final weather = await _weatherRepository.getWeatherByCityName(cityName);
      emit(SuccessWeatherState(weather: weather));
    } on HttpException catch (exception) {
      emit(ErrorWeatherState(exception: exception));
    } catch (e) {
      print(e);
    }
  }
}
