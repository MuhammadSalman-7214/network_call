
import 'package:json_annotation/json_annotation.dart';
import 'package:networkcall/models/temprature.dart';
part 'tempratureresponse.g.dart';

@JsonSerializable()
class TempratureResponse {

  @JsonKey(name: 'main')
  Temprature temprature;

  TempratureResponse(this.temprature);

  factory TempratureResponse.fromJson(Map<String, dynamic> json) => _$TempratureResponseFromJson(json);
  Map<String, dynamic> toJson()=>_$TempratureResponseToJson(this);
}