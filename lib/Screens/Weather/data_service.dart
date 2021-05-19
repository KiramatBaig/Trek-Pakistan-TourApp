import 'dart:convert';
import 'package:flutter_auth/Screens/Weather/Models.dart';
import 'package:http/http.dart' as http;

import 'Models.dart';

class DataService {
  Future<WeatherResponse> getWeather(String city) async {
    // api.openweathermap.org/data/2.5/weather?q={city name}&appid={API key}

    final queryParameters = {
      'q': city,
      'appid': 'aafac351fe4e0542f7b65abdcb0f8ac4',
      'units': 'metric'
    };

    final uri = Uri.https(
        'api.openweathermap.org', '/data/2.5/weather', queryParameters);

    final response = await http.get(uri);

    print(response.body);
    final json = jsonDecode(response.body);
    return WeatherResponse.fromJson(json);
  }
}