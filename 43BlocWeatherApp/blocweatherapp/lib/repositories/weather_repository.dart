import 'dart:convert';
import 'dart:async';

import 'package:blocweatherapp/models/weather.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

const baseUrl = 'https://www.metaweather.com';
final locationUrl = (city) => '$baseUrl/api/location/search/?query=$city';
final weatherUrl = (locationId) => '$baseUrl/api/location/$locationId';

class WeatherRepository {
  final http.Client httpClient;
  WeatherRepository({@required this.httpClient})
      : assert(httpClient != null);

  Future<Weather> getWeatherOfCity(String city) async {
    final int locationId = await getLocationId(city);
    return fetchWeather(locationId);
  }

  Future<int> getLocationId(String city) async {
    final response = await this.httpClient.get(locationUrl(city));
    if (response.statusCode != 200) {
      throw Exception('error getting locationId for city');
    }
    final cities = jsonDecode(response.body) as List;
    return (cities.first)['woeid'] ?? 0;
  }

  Future<Weather> fetchWeather(int locationId) async {
    final weatherResponse = await this.httpClient.get(weatherUrl(locationId));

    if (weatherResponse.statusCode != 200) {
      throw Exception('error getting weather for location');
    }
    final weatherJson = jsonDecode(weatherResponse.body);
    return Weather.fromJson(weatherJson);
  }
}
