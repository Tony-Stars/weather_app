class WeatherInfo {
  final String main;
  final String description;
  final String icon;

  const WeatherInfo({
    required this.main,
    required this.description,
    required this.icon,
  });

  String get iconUrl => 'http://openweathermap.org/img/wn/$icon@2x.png';

  factory WeatherInfo.fromJson(Map<String, dynamic> json) {
    return WeatherInfo(
      main: json['main'],
      description: json['description'],
      icon: json['icon'],
    );
  }
}
