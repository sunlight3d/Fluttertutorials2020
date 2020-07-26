import 'package:blocweatherapp/models/weather.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
abstract class ThemeEvent extends Equatable {
  const ThemeEvent();
}

class ThemeEventWeatherChanged extends ThemeEvent {
  final WeatherCondition weatherCondition;

  const ThemeEventWeatherChanged({@required this.weatherCondition})
      : assert(weatherCondition != null);

  @override
  List<Object> get props => [weatherCondition];
}
