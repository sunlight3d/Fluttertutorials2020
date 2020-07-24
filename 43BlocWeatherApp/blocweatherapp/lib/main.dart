import 'package:blocweatherapp/repositories/weather_repository.dart';
import 'package:blocweatherapp/screens/weather_screen.dart';
import 'package:blocweatherapp/states/theme_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'blocs/settings_bloc.dart';
import 'blocs/theme_bloc.dart';
import 'blocs/weather_bloc.dart';
import 'blocs/weather_bloc_observer.dart';

void main() {
  Bloc.observer = WeatherBlocObserver();
  final WeatherRepository weatherRepository = WeatherRepository(
      httpClient: http.Client()
  );
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider<ThemeBloc>(
        create: (context) {
          final x = ThemeBloc();
          return x;
        },
      ),
      BlocProvider<SettingsBloc>(
        create: (context) => SettingsBloc(),
      ),
    ],
    child: App(weatherRepository: weatherRepository),
  ),);
}

class App extends StatelessWidget {
  final WeatherRepository weatherRepository;

  App({Key key, @required this.weatherRepository})
      : assert(weatherRepository != null),
        super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, themeState) {
        return MaterialApp(
          title: 'Flutter Weather Bloc',
          home: BlocProvider(
            create: (context) => WeatherBloc(
              weatherRepository: weatherRepository,
            ),
            child: WeatherScreen(),
          ),
        );
      },
    );
  }
}
