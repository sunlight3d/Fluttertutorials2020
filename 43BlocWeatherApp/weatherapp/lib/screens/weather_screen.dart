import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/blocs/theme_bloc.dart';
import 'package:weatherapp/blocs/weather_bloc.dart';
import 'package:weatherapp/events/theme_event.dart';
import 'package:weatherapp/events/weather_event.dart';
import 'package:weatherapp/screens/city_search_screen.dart';
import 'package:weatherapp/screens/settings_screen.dart';
import 'package:weatherapp/screens/temperature_widget.dart';
import 'package:weatherapp/states/theme_state.dart';
import 'package:weatherapp/states/weather_state.dart';

class WeatherScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _WeatherScreenState();
}
class _WeatherScreenState extends State<WeatherScreen> {
  Completer<void> _completer;
  @override
  void initState() {
    super.initState();
    _completer = Completer<void>();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather App using Flutter Bloc'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              //Navigate to SettingsScreen
              Navigator.push(context,
                MaterialPageRoute(
                  builder: (context) => SettingsScreen(),
                )
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () async {
              //Navigate to CitySearchScreen
              final typedCity = await Navigator.push(context,
                  MaterialPageRoute(
                    builder: (context) => CitySearchScreen()
                  ),
              );
              if(typedCity != null) {
                BlocProvider.of<WeatherBloc>(context).add(
                  WeatherEventRequested(city: typedCity)
                );
              }
            },
          )
        ],
      ),
      body: Center(
        child: BlocConsumer<WeatherBloc, WeatherState>(
          listener: (context, weatherState) {
            if(weatherState is WeatherStateSuccess) {
              BlocProvider.of<ThemeBloc>(context).add(
                ThemeEventWeatherChanged(
                    weatherCondition: weatherState.weather.weatherCondition)
              );
              _completer?.complete();
              _completer = Completer();
            }
          },
          builder: (context, weatherState) {
            if(weatherState is WeatherStateLoading) {
              return Center(child: CircularProgressIndicator());
            }
            if(weatherState is WeatherStateSuccess) {
              final weather = weatherState.weather;
              return BlocBuilder<ThemeBloc, ThemeState>(
                builder: (context, themeState){
                  return RefreshIndicator(
                    onRefresh: (){
                      BlocProvider.of<WeatherBloc>(context).add(
                        WeatherEventRefresh(city: weather.location)
                      );
                      //return a "Completer object"
                      return _completer.future;
                    },
                    child: Container(
                      color: themeState.backgroundColor,
                      child: ListView(
                        children: <Widget>[
                          Column(
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
                              //show more here, put together inside a Widget
                              TemperatureWidget(
                                weather: weather,
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                },
              );
            }
            if(weatherState is WeatherStateFailure) {
              return Text(
                'Something went wrong',
                style: TextStyle(color: Colors.redAccent, fontSize: 16),
              );
            }
            return Center(child: Text(
              'select a location first !',
              style: TextStyle(fontSize: 30),
            ),);
          }
        ),
      ),
    );
  }
}