import 'dart:async';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
abstract class WeatherEvent extends Equatable {
  const WeatherEvent();
}

class WeatherEventRequested extends WeatherEvent {
  final String city;
  const WeatherEventRequested({@required this.city})
      : assert(city != null);
  @override
  List<Object> get props => [city];
}

class WeatherEventRefresh extends WeatherEvent {
  final String city;
  const WeatherEventRefresh({@required this.city})
      : assert(city != null);

  @override
  List<Object> get props => [city];
}