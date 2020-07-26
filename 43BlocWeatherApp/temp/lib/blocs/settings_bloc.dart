import 'dart:async';
import 'package:blocweatherapp/events/settings_event.dart';
import 'package:blocweatherapp/states/setting_state.dart';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  SettingsBloc()
      : super(SettingsState(temperatureUnit: TemperatureUnit.celsius));
  @override
  Stream<SettingsState> mapEventToState(SettingsEvent settingsEvent) async* {
    if (settingsEvent is SettingsEventToggleUnit) {
      yield SettingsState(
        temperatureUnit: state.temperatureUnit == TemperatureUnit.celsius
            ? TemperatureUnit.fahrenheit
            : TemperatureUnit.celsius,
      );
    }
  }
}