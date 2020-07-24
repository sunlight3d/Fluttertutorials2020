import 'package:blocweatherapp/blocs/settings_bloc.dart';
import 'package:blocweatherapp/blocs/theme_bloc.dart';
import 'package:blocweatherapp/events/settings_event.dart';
import 'package:blocweatherapp/models/weather.dart';
import 'package:blocweatherapp/states/setting_state.dart';
import 'package:blocweatherapp/states/theme_state.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class TemperatureWidget extends StatelessWidget {
  final Weather weather;
  TemperatureWidget({
    Key key,
    @required this.weather,
  })  : assert(weather != null),
        super(key: key);
  Image _mapConditionToImage({WeatherCondition condition}) {
    Image image;
    switch (condition) {
      case WeatherCondition.clear:
      case WeatherCondition.lightCloud:
        image = Image.asset('assets/clear.png');
        break;
      case WeatherCondition.hail:
      case WeatherCondition.snow:
      case WeatherCondition.sleet:
        image = Image.asset('assets/snow.png');
        break;
      case WeatherCondition.heavyCloud:
        image = Image.asset('assets/cloudy.png');
        break;
      case WeatherCondition.heavyRain:
      case WeatherCondition.lightRain:
      case WeatherCondition.showers:
        image = Image.asset('assets/rainy.png');
        break;
      case WeatherCondition.thunderstorm:
        image = Image.asset('assets/thunderstorm.png');
        break;
      case WeatherCondition.unknown:
        image = Image.asset('assets/clear.png');
        break;
    }
    return image;
  }
  int _toFahrenheit(double celsius) => ((celsius * 9 / 5) + 32).round();

  String _formattedTemperature(double t, TemperatureUnit temperatureUnit) =>
      temperatureUnit == TemperatureUnit.fahrenheit ? '${_toFahrenheit(t)}°F' : '${t.round()}°C';
  @override
  Widget build(BuildContext context) {
    final _themeBloc = BlocProvider.of<ThemeBloc>(context);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _mapConditionToImage(condition: weather.weatherCondition),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 30, horizontal: 10),
              child: BlocBuilder<SettingsBloc, SettingsState>(
                builder: (context, settingsState) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        'min:   ${_formattedTemperature(weather.maxTemp, settingsState.temperatureUnit)}',
                        style: TextStyle(
                          fontSize: 14,
                          color: _themeBloc.state.textColor,
                        ),
                      ),
                      Text(
                        'Temperature:   ${_formattedTemperature(weather.temp, settingsState.temperatureUnit)}',
                        style: TextStyle(
                          fontSize: 14,
                          color: _themeBloc.state.textColor,
                        ),
                      ),
                      Text(
                        'min:   ${_formattedTemperature(weather.minTemp, settingsState.temperatureUnit)}°',
                        style: TextStyle(
                          fontSize: 14,
                          color: _themeBloc.state.textColor,
                        ),
                      )
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}
