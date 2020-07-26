import 'package:equatable/equatable.dart';
enum WeatherCondition {
  snow,
  sleet,
  hail,
  thunderstorm,
  heavyRain,
  lightRain,
  showers,
  heavyCloud,
  lightCloud,
  clear,
  unknown
}
class Weather extends Equatable {
  final WeatherCondition weatherCondition;
  final String formattedCondition;
  final double minTemp;
  final double temp;
  final double maxTemp;
  final int locationId;
  final String created;
  final DateTime lastUpdated;
  final String location;
  //constructor
  const Weather({
    this.weatherCondition,
    this.formattedCondition,
    this.minTemp,
    this.temp,
    this.maxTemp,
    this.locationId,
    this.created,
    this.lastUpdated,
    this.location,
  });
  @override
  // TODO: implement props
  List<Object> get props => [
    weatherCondition,
    formattedCondition,
    minTemp,
    temp,
    maxTemp,
    locationId,
    created,
    lastUpdated,
    location,
  ];
  //convert from JSON to Weather object
/*
consolidated_weather": [
    {
      "id": 5001437304061952,
      "weather_state_name": "Light Cloud",
      "weather_state_abbr": "lc",
      "wind_direction_compass": "SSE",
      "created": "2020-07-26T00:22:18.967978Z",
      "applicable_date": "2020-07-25",
      "min_temp": 22.825,
      "max_temp": 31.585,
      "the_temp": 32.2,
      "wind_speed": 4.388510937739601,
      "wind_direction": 165.1056162097894,
      "air_pressure": 1018.5,
      "humidity": 56,
      "visibility": 15.249070428696413,
      "predictability": 70
    },
    ...
 */
  factory Weather.fromJson(dynamic jsonObject) {
    final consolidatedWeather = jsonObject['consolidated_weather'][0];
    return Weather(
      weatherCondition: _mapStringToWeatherCondition(consolidatedWeather['weather_state_abbr']) ?? '',
      formattedCondition: consolidatedWeather['weather_state_name'] ?? '',
      minTemp: consolidatedWeather['min_temp'] as double,
      temp: consolidatedWeather['the_temp'] as double,
      maxTemp: consolidatedWeather['max_temp'] as double,
      locationId: jsonObject['woeid'] as int, //Where On Earth Identifier = woeid
      created: consolidatedWeather['created'],
      lastUpdated: DateTime.now(),
      location: jsonObject['title']
    );
  }
  static WeatherCondition _mapStringToWeatherCondition(String inputString) {
    Map<String, WeatherCondition> map = {
      'sn': WeatherCondition.snow,
      'sl': WeatherCondition.sleet,
      'h': WeatherCondition.hail,
      't': WeatherCondition.thunderstorm,
      'hr': WeatherCondition.heavyRain,
      'lr': WeatherCondition.lightRain,
      's': WeatherCondition.showers,
      'hc': WeatherCondition.heavyCloud,
      'lc': WeatherCondition.lightCloud,
      'c': WeatherCondition.clear
    };
    return map[inputString] ?? WeatherCondition.unknown;
  }
}