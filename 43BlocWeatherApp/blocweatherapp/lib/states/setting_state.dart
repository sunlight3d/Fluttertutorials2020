import 'package:blocweatherapp/events/settings_event.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
class SettingsState extends Equatable {
  final TemperatureUnit temperatureUnit;
  const SettingsState({@required this.temperatureUnit})
      : assert(temperatureUnit != null);
  @override
  List<Object> get props => [temperatureUnit];
}
