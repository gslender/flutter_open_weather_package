import 'package:open_weather_client/enums/weather_main_condition.dart';

class WeatherConditions {
  final String main;
  final String description;
  final int id;
  WeatherConditions(this.main, this.description, this.id);

  @override
  String toString() {
    return 'WeatherConditions id:$id $main $description';
  }

  WeatherMainCondition getWeatherMainCondition() {
    if (id >= 200 && id <= 299) return WeatherMainCondition.thunderstorm;
    if (id >= 300 && id <= 399) return WeatherMainCondition.drizzle;
    if (id >= 500 && id <= 599) return WeatherMainCondition.rain;
    if (id >= 600 && id <= 699) return WeatherMainCondition.snow;

    if (id == 701) return WeatherMainCondition.mist;
    if (id == 711) return WeatherMainCondition.smoke;
    if (id == 721) return WeatherMainCondition.haze;
    if (id == 731) return WeatherMainCondition.dust;
    if (id == 741) return WeatherMainCondition.fog;
    if (id == 751) return WeatherMainCondition.sand;
    if (id == 761) return WeatherMainCondition.dust;
    if (id == 762) return WeatherMainCondition.ash;
    if (id == 771) return WeatherMainCondition.squalls;
    if (id == 781) return WeatherMainCondition.tornado;

    if (id == 800) return WeatherMainCondition.clear;
    if (id >= 801 && id <= 899) return WeatherMainCondition.clouds;

    return WeatherMainCondition.unknown;
  }
}
