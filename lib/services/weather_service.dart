import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class WeatherService {
  static const baseURL = "http://api.openweathermap.org/data/2.5/weather";
  final String apiKey;

  WeatherService(this.apiKey);

  Future<Weather> fetchWeather(String city) async {
    final url = Uri.parse('$baseURL?q=$city&appid=$apiKey&units=metric');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return Weather.fromJson(data);
    } else {
      throw Exception('Failed to load weather data');
    }
  }

  Future<String> getCurrentCity() async {
    // to get location permission from the user
    LocationPermission permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    //fetch current location
    Position position = await Geolocator.getCurrentPosition();
    desiredAccuracy:
    LocationAccuracy.high;

    //convert the location into a list of placemarks
    List<Placemark> placemarks = await placemarkFromCoordinates(
        position.latitude, position.longitude);

    //extract the city name from the placemarks
    String? city = placemarks.first.locality;

    return city ?? 'Unknown City';

  }
}
