import 'package:flutter_test/flutter_test.dart';

import 'package:open_weather_client/open_weather.dart';

void main() {
  group('Open Weather unit tests', () {
    setUpAll(() {});
    setUp(() {});

    const double latitude = 52.0841037;
    const double longitude = 4.9424092;
    const String apiKey = 'c4bbb94f9fcfede0eb5219111804b040';
    const String wrongApiKey = '0';
    const String cityName = 'Miami';

    final OpenWeather openWeather = OpenWeather(apiKey: apiKey);
    final OpenWeather wrongOpenWeather = OpenWeather(apiKey: wrongApiKey);

    test('Fetch weather by CityName', () async {
      WeatherData weatherData =
          await openWeather.currentWeatherByCityName(cityName: cityName);
      expect(weatherData.name, 'Miami');
    });

    test('Fetch weather by CityName with error due to wrong API credentials',
        () async {
      expect(
          () => wrongOpenWeather.currentWeatherByCityName(cityName: cityName),
          throwsA(isInstanceOf<Exception>()));
    });

    test('Fetch weather by Location', () async {
      WeatherData weatherData = await openWeather.currentWeatherByLocation(
          latitude: latitude, longitude: longitude);
      expect(weatherData.name, 'Gemeente Woerden');
    });

    test('Fetch weather by Location with error due to wrong API credentials',
        () async {
      expect(
          () => wrongOpenWeather.currentWeatherByLocation(
              latitude: latitude, longitude: longitude),
          throwsA(isInstanceOf<Exception>()));
    });
  });
}
