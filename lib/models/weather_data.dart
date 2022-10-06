import 'package:json_annotation/json_annotation.dart';
import 'package:open_weather_client/models/coordinates.dart';
import 'package:open_weather_client/models/details.dart';
import 'package:open_weather_client/models/temperature.dart';
import 'package:open_weather_client/models/system.dart';
import 'package:open_weather_client/models/wind.dart';

part 'weather_data.g.dart';

@JsonSerializable()
class WeatherData {
  /// Generic class to hold all the data being extracted from the API response
  /// [details] holds weather basic details as a list
  /// [wind] holds wind related details as an object
  /// [temperature] holds temperature related details as an object
  /// [coordinates] holds coordinates of the place
  /// [name] is used to extract the name of the identified place from the API response
  @JsonKey(name: 'weather')
  List<Details> details;
  Wind wind;
  @JsonKey(name: 'main')
  Temperature temperature;
  @JsonKey(name: 'coord')
  Coordinates coordinates;
  String name;
  @JsonKey(name: 'sys')
  System system;
  int? dt;

  @JsonKey(ignore: true)
  DateTime get datetime => dt != null
      ? DateTime.fromMillisecondsSinceEpoch(dt! * 1000)
      : DateTime.now();
  set datetime(DateTime dateTime) =>
      dt = dateTime.millisecondsSinceEpoch ~/ 1000;

  WeatherData({
    required this.details,
    required this.temperature,
    required this.wind,
    required this.coordinates,
    required this.name,
    required this.system,
    this.dt,
    DateTime? dateTime,
  }) {
    if (dt == null && dateTime != null) {
      dt = dateTime.millisecondsSinceEpoch ~/ 1000;
    }
  }

  factory WeatherData.fromJson(Map<String, dynamic> json) =>
      _$WeatherDataFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherDataToJson(this);
}
