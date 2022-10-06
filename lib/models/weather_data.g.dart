// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherData _$WeatherDataFromJson(Map json) => WeatherData(
      details: (json['weather'] as List<dynamic>)
          .map((e) => Details.fromJson(Map<String, dynamic>.from(e as Map)))
          .toList(),
      temperature:
          Temperature.fromJson(Map<String, dynamic>.from(json['main'] as Map)),
      wind: Wind.fromJson(Map<String, dynamic>.from(json['wind'] as Map)),
      coordinates:
          Coordinates.fromJson(Map<String, dynamic>.from(json['coord'] as Map)),
      name: json['name'] as String,
      system: System.fromJson(Map<String, dynamic>.from(json['sys'] as Map)),
      date: json['dt'] as int,
    );

Map<String, dynamic> _$WeatherDataToJson(WeatherData instance) =>
    <String, dynamic>{
      'weather': instance.details.map((e) => e.toJson()).toList(),
      'wind': instance.wind.toJson(),
      'main': instance.temperature.toJson(),
      'coord': instance.coordinates.toJson(),
      'name': instance.name,
      'sys': instance.system.toJson(),
      'dt': instance.date,
    };
