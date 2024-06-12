import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/weather.dart';

Future<Weather> fetchWeather(String city) async {
  final apiKey = '53e5b92779599852acc27d7d7e8fedd8';
  final response = await http.get(Uri.parse(
      'https://api.openweathermap.org/data/2.5/weather?q=$city&appid=$apiKey&units=metric&lang=pt'));

  if (response.statusCode == 200) {
    return Weather.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to load weather data');
  }
}
