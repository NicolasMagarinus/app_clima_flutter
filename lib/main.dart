import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/city_list.dart';
import 'screens/city_form.dart';
import 'screens/weather_details.dart';
import 'providers/city_provider.dart';
import 'models/weather.dart';
import 'utils/fade_page_route.dart';

void main() {
  runApp(WeatherApp());
}

class WeatherApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CityProvider(),
      child: MaterialApp(
        title: 'App Tempo',
        theme: ThemeData(
          primaryColor: Colors.blue[700],
          colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.blueAccent),
          fontFamily: 'Raleway',
          textTheme: TextTheme(
            headlineLarge: TextStyle(fontSize: 36.0, fontWeight: FontWeight.bold),
            bodyLarge: TextStyle(fontSize: 18.0),
          ),
        ),
        home: CityListScreen(),
        routes: {
          '/addCity': (context) => AddCityForm(),
        },
        onGenerateRoute: (settings) {
          if (settings.name == '/weatherDetails') {
            final Weather weather = settings.arguments as Weather;
            return FadePageRoute(
              page: WeatherDetailsScreen(weather: weather),
            );
          }
          return null;
        },
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
