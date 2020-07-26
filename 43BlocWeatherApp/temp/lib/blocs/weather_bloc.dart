import 'dart:async';

import 'package:blocweatherapp/events/weather_event.dart';
import 'package:blocweatherapp/models/weather.dart';
import 'package:blocweatherapp/states/weather_state.dart';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:blocweatherapp/repositories/weather_repository.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherRepository weatherRepository;

  WeatherBloc({@required this.weatherRepository})
      : assert(weatherRepository != null),
        super(WeatherStateInitial());

  @override
  Stream<WeatherState> mapEventToState(WeatherEvent weatherEvent) async* {
    if (weatherEvent is WeatherEventRequested) {
      yield WeatherStateLoading();
      try {
        final Weather weather = await weatherRepository.getWeatherOfCity(weatherEvent.city);
        yield WeatherStateLoadSuccess(weather: weather);
      } catch (_) {
        yield WeatherStateFailure();
      }
    } else if(weatherEvent is WeatherEventRefresh) {
      try {
        final Weather weather = await weatherRepository.getWeatherOfCity(weatherEvent.city);
        yield WeatherStateLoadSuccess(weather: weather);
      } catch (_) {
        yield WeatherStateFailure();
      }
    }
  }
}
