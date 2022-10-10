import 'dart:io';

import 'package:weather_app/open_weather_api.dart';
import 'package:weather_app/weather.dart';

class WeatherRepository {
  final openWeatherApi = OpenWeatherApi();

  Future<Weather> getWeatherByCityName(String cityName) async {
    final openWeatherJson = await openWeatherApi.getWeatherByCityName(cityName);
    if (openWeatherJson['cod'] == 200) {
      return Weather.fromOpenWeatherJson(openWeatherJson);
    } else {
      throw const HttpException('City not found');
    }
  }
}
