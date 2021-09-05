import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';
import 'package:weather_app/core/bloc/observer/weather_observer.dart';
import 'package:weather_app/core/components/themes.dart';
import 'package:weather_app/core/service/http.dart';
import 'package:weather_app/features/location/presenter/select_location_screen.dart';

final GetIt injectorInterface = GetIt.instance;

setUpInjectorInterface() async {
  return injectorInterface.registerSingleton<Http>(Http());
}

var logger = Logger(
  printer: PrettyPrinter(),
);

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setUpInjectorInterface();
  Bloc.observer = WeatherObserver();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ThemeProvider(
        initTheme: AppThemes.light,
        builder: (context, myTheme) {
          return MaterialApp(
              title: 'Flutter Demo',
              theme: myTheme,
              home: SelectLocationScreen());
        });
  }
}
