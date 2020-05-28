// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'temprature.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Temprature _$TempratureFromJson(Map<String, dynamic> json) {
  return Temprature(
    (json['temp'] as num)?.toDouble(),
    (json['temp_min'] as num)?.toDouble(),
    (json['temp_max'] as num)?.toDouble(),
    (json['pressure'] as num)?.toDouble(),
    (json['humidity'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$TempratureToJson(Temprature instance) =>
    <String, dynamic>{
      'temp': instance.temp,
      'temp_min': instance.tempMin,
      'temp_max': instance.tempMax,
      'pressure': instance.pressure,
      'humidity': instance.humidity,
    };
