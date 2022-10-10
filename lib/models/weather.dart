import 'package:weather_app/temperature.dart';
import 'package:weather_app/weather_info.dart';

class Weather {
  final String cityName;
  final Temperature temperature;
  final WeatherInfo info;

  const Weather({
    required this.cityName,
    required this.temperature,
    required this.info,
  });

  factory Weather.fromOpenWeatherJson(Map<String, dynamic> json) {
    return Weather(
      cityName: json['name'],
      temperature: Temperature.fromJson(json['main']),
      info: WeatherInfo.fromJson(json['weather'][0]),
    );
  }
}
