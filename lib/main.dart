import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/weather_cubit.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _cityNameController = TextEditingController();

  void _load(BuildContext context) async {
    final weatherCubit = context.read<WeatherCubit>();
    weatherCubit.getWeatherByCityName(_cityNameController.text);
  }

  @override
  void dispose() {
    super.dispose();
    _cityNameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<WeatherCubit>(
      create: (context) => WeatherCubit(),
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // if (_weather != null)
              BlocBuilder<WeatherCubit, WeatherState>(
                  builder: (context, state) {
                if (state is EmptyWeatherState) {
                  return Container();
                } else if (state is SuccessWeatherState) {
                  final weather = state.weather;
                  return Column(
                    children: [
                      Text(
                        weather.cityName,
                        style: const TextStyle(fontSize: 40),
                      ),
                      const SizedBox(height: 30),
                      Image.network(weather.info.iconUrl),
                      Text(
                        '${weather.temperature.temperature.round()}°C',
                        style: const TextStyle(fontSize: 40),
                      ),
                      Text(
                        weather.info.main,
                        style: const TextStyle(fontSize: 20),
                      ),
                      Text(
                        weather.info.description,
                        style: const TextStyle(fontSize: 15),
                      )
                    ],
                  );
                } else {
                  return Container();
                }
              }),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: TextField(
                  controller: _cityNameController,
                  decoration: const InputDecoration(labelText: 'City'),
                  textAlign: TextAlign.center,
                ),
              ),
              BlocBuilder<WeatherCubit, WeatherState>(
                builder: (context, state) => ElevatedButton(
                  onPressed: () => _load(context),
                  child: const Text('Load'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
