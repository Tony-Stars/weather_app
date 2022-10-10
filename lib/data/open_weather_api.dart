import 'dart:convert';

import 'package:http/http.dart' as http;

class OpenWeatherApi {
  final String _apiKey = '54b5612882e08acfcbaf0474aba71a8b';

  Future<dynamic> getWeatherByCityName(String cityName) async {
    final queryParameters = {
      'q': cityName,
      'appid': _apiKey,
      'lang': 'ru',
      'units': 'metric',
    };
    final uri = Uri.https(
      'api.openweathermap.org',
      '/data/2.5/weather',
      queryParameters,
    );
    final response = await http.get(uri);
    return jsonDecode(response.body);
  }
}
