import 'package:json_annotation/json_annotation.dart';

part 'system.g.dart';

@JsonSerializable()
class System {
  /// System class holds the sys related info from the API response
  /// [country]  Country code (GB, JP etc.)
  /// [sunrise]  Sunrise time, unix, UTC
  /// [sunset]  Sunset time, unix, UTC
  String country;
  int sunrise;
  int sunset;

  System({
    required this.country,
    required this.sunrise,
    required this.sunset,
  });

  factory System.fromJson(Map<String, dynamic> json) => _$SystemFromJson(json);

  Map<String, dynamic> toJson() => _$SystemToJson(this);
}
