import 'dart:async';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

abstract class SettingsEvent extends Equatable {}

class SettingsEventToggleUnit extends SettingsEvent {
  @override
  List<Object> get props => [];
}

enum TemperatureUnit {
  fahrenheit,
  celsius
}