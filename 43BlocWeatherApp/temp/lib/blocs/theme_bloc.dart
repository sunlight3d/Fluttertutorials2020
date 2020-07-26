import 'dart:async';

import 'package:blocweatherapp/events/theme_event.dart';
import 'package:blocweatherapp/models/weather.dart';
import 'package:blocweatherapp/states/theme_state.dart';
import 'package:flutter/material.dart';

import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc()
      : super(ThemeState(backgroundColor: Colors.lightBlue,textColor: Colors.white));

  @override
  Stream<ThemeState> mapEventToState(ThemeEvent themeEvent) async* {
    if (themeEvent is ThemeEventWeatherChanged) {
      yield _mapWeatherConditionToThemeData(themeEvent.weatherCondition);
    }
  }

  ThemeState _mapWeatherConditionToThemeData(WeatherCondition weatherCondition) {
    ThemeState themeState;

    switch (weatherCondition) {
      case WeatherCondition.clear:
      case WeatherCondition.lightCloud:
        themeState = ThemeState(
          backgroundColor: Colors.yellow,
          textColor: Colors.black
        );
        break;
      case WeatherCondition.hail:
      case WeatherCondition.snow:
      case WeatherCondition.sleet:
        themeState = ThemeState(
          backgroundColor: Colors.lightBlue,
          textColor: Colors.white
        );
        break;
      case WeatherCondition.heavyCloud:
        themeState = ThemeState(
          backgroundColor: Colors.grey,
          textColor: Colors.black,
        );
        break;
      case WeatherCondition.heavyRain:
      case WeatherCondition.lightRain:
      case WeatherCondition.showers:
        themeState = ThemeState(
          backgroundColor: Colors.indigo,
          textColor: Colors.white,
        );
        break;
      case WeatherCondition.thunderstorm:
        themeState = ThemeState(
          backgroundColor: Colors.deepPurple,
          textColor: Colors.white,
        );
        break;
      case WeatherCondition.unknown:
        themeState = ThemeState(
          backgroundColor: Colors.lightBlue,
          textColor: Colors.white,
        );
        break;
    }
    return themeState; //unchanged
  }
}