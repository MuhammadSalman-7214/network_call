// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tempratureresponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TempratureResponse _$TempratureResponseFromJson(Map<String, dynamic> json) {
  return TempratureResponse(
    json['main'] == null
        ? null
        : Temprature.fromJson(json['main'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$TempratureResponseToJson(TempratureResponse instance) =>
    <String, dynamic>{
      'main': instance.temprature,
    };
