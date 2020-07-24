import 'dart:async';
import 'package:blocweatherapp/blocs/theme_bloc.dart';
import 'package:blocweatherapp/blocs/weather_bloc.dart';
import 'package:blocweatherapp/events/theme_event.dart';
import 'package:blocweatherapp/events/weather_event.dart';
import 'package:blocweatherapp/screens/settings_screen.dart';
import 'package:blocweatherapp/screens/temperature_widget.dart';
import 'package:blocweatherapp/states/theme_state.dart';
import 'package:blocweatherapp/states/weather_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'city_selection_screen.dart';

class WeatherScreen extends StatefulWidget {
  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  Completer<void> _refreshCompleter;
  @override
  void initState() {
    super.initState();
    _refreshCompleter = Completer<void>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Weather'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Settings(),
                ),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () async {
              final city = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CitySelection(),
                ),
              );
              if (city != null) {
                BlocProvider.of<WeatherBloc>(context)
                    .add(WeatherEventRequested(city: city));
              }
            },
          )
        ],
      ),
      body: Center(
        child: BlocConsumer<WeatherBloc, WeatherState>(
          listener: (context, weatherState) {
            if (weatherState is WeatherStateLoadSuccess) {
              BlocProvider.of<ThemeBloc>(context).add(
                ThemeEventWeatherChanged(weatherCondition: weatherState.weather.weatherCondition),
              );
              _refreshCompleter?.complete();
              _refreshCompleter = Completer();
            }
          },
          builder: (context, weatherState) {
            if (weatherState is WeatherStateLoading) {
              return Center(child: CircularProgressIndicator());
            }
            if (weatherState is WeatherStateLoadSuccess) {
              final weather = weatherState.weather;
              return BlocBuilder<ThemeBloc, ThemeState>(
                builder: (context, themeState) {
                  return RefreshIndicator(
                    onRefresh: () {
                      BlocProvider.of<WeatherBloc>(context).add(
                        WeatherEventRefresh(city: weather.location),
                      );
                      return _refreshCompleter.future;
                    },
                    child: ListView(
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                            color: themeState.backgroundColor
                          ),
                          child: Column(
                            children: <Widget>[
                              Text(
                                weather.location,
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: themeState.textColor
                                ),
                              ),
                              Padding(padding: EdgeInsets.symmetric(vertical: 2),),
                              Center(
                                child: Text(
                                  'Updated: ${TimeOfDay.fromDateTime(weather.lastUpdated).format(context)}',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: themeState.textColor
                                  ),
                                ),
                              ),
                              TemperatureWidget(
                                weather: weather,
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                },
              );
            }
            if (weatherState is WeatherStateFailure) {
              return Text(
                'Something went wrong!',
                style: TextStyle(color: Colors.red, fontSize: 16),
              );
            }
            return Center(child: Text('Please Select a Location'));
          },
        ),
      ),
    );
  }
}
