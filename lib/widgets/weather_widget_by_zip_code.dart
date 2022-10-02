import 'package:flutter/material.dart';
import 'package:open_weather_client/open_weather.dart';
import 'package:open_weather_client/widgets/modules/location_view_widget.dart';
import 'package:open_weather_client/widgets/modules/weather_description_view_widget.dart';
import 'package:open_weather_client/widgets/modules/weather_summary_widget.dart';

class OpenWeatherByZipCode extends StatefulWidget {
  /// Built in widget to support easy integration.
  /// The widget lists some weather data based on the [zipCode] and [countryCode]
  /// With the help of [weatherUnits] you specify the type of unit.
  /// Please note, in order to use the widget a valid [apiKey] is required.
  /// For more info, read the documentation.
  final String apiKey;
  final int zipCode;
  final String countryCode;
  final WeatherUnits weatherUnits;
  final Color color;
  const OpenWeatherByZipCode(
      {super.key,
      required this.apiKey,
      required this.zipCode,
      required this.countryCode,
      this.weatherUnits = WeatherUnits.imperial,
      this.color = Colors.black});
  @override
  State<OpenWeatherByZipCode> createState() => _OpenWeatherByZipCodeState();
}

class _OpenWeatherByZipCodeState extends State<OpenWeatherByZipCode> {
  late OpenWeather openWeather;

  @override
  void initState() {
    super.initState();
    openWeather = OpenWeather(apiKey: widget.apiKey);
  }

  Future<WeatherData> _getCurrentWeatherByZipCode() async {
    return openWeather.currentWeatherByZipCode(
        zipCode: widget.zipCode,
        countryCode: widget.countryCode,
        weatherUnits: WeatherUnits.metric);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _getCurrentWeatherByZipCode(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              LocationView(
                weatherData: snapshot.data!,
                color: widget.color,
              ),
              WeatherSummary(
                weatherData: snapshot.data!,
                color: widget.color,
              ),
              WeatherDescriptionView(
                weatherData: snapshot.data!,
                color: widget.color,
              ),
            ],
          );
        } else if (snapshot.hasError) {
          return Center(
              child: Text(
            'Oops something went wrong!',
            style: TextStyle(color: widget.color),
          ));
        }
        return Center(
            child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(widget.color),
        ));
      },
    );
  }
}
