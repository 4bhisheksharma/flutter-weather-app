import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/weather_service.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  late final WeatherService _weatherService;
  Weather? _weather;

  // Fetch weather
  Future<void> _fetchWeather() async {
    try {
      String cityName = await _weatherService.getCurrentCity();
      Weather weather = await _weatherService.fetchWeather(cityName);
      setState(() {
        _weather = weather;
      });
    } catch (e) {
      print('Error fetching weather: $e');
    }
  }

  @override
  void initState() {
    super.initState();

    final apiKey = dotenv.env['WEATHER_API_KEY'];
    if (apiKey == null || apiKey.isEmpty) {
      throw Exception('WEATHER_API_KEY not found in .env');
    }

    _weatherService = WeatherService(apiKey);
    _fetchWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // city name
            Text(_weather?.cityName ?? 'Loading City...'),

            // temperature
            if (_weather != null)
              Text('${_weather!.temperature.round()}°C')
            else
              Text('Loading Temperature...'),
          ],
        ),
      ),
    );
  }
}
