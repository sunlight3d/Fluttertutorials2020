import 'package:blocweatherapp/blocs/settings_bloc.dart';
import 'package:blocweatherapp/events/settings_event.dart';
import 'package:blocweatherapp/states/setting_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Settings')),
      body: ListView(
        children: <Widget>[
          BlocBuilder<SettingsBloc, SettingsState>(
            builder: (context, settingsState) {
              return ListTile(
                title: Text(
                  'Temperature Unit',
                ),
                isThreeLine: true,
                subtitle:
                Text(
                  settingsState.temperatureUnit == TemperatureUnit.celsius ? 'Celsius' : 'Fahrenheit',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                trailing: Switch(
                  value: settingsState.temperatureUnit == TemperatureUnit.celsius,
                  onChanged: (_) => BlocProvider.of<SettingsBloc>(context)
                      .add(SettingsEventToggleUnit()),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}