import 'package:blocweatherapp/models/weather.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

abstract class WeatherState extends Equatable {
  const WeatherState();

  @override
  List<Object> get props => [];
}

class WeatherStateInitial extends WeatherState {}

class WeatherStateLoading extends WeatherState {}

class WeatherStateLoadSuccess extends WeatherState {
  final Weather weather;
  const WeatherStateLoadSuccess({@required this.weather}) : assert(weather != null);
  @override
  List<Object> get props => [weather];
}

class WeatherStateFailure extends WeatherState {}