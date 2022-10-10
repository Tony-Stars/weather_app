class Temperature {
  final double temperature;

  const Temperature({required this.temperature});

  factory Temperature.fromJson(Map<String, dynamic> json) {
    return Temperature(temperature: json['temp']);
  }
}
