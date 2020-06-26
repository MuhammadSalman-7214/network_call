
import 'package:json_annotation/json_annotation.dart';
part 'temprature.g.dart';

@JsonSerializable()
class Temprature {
  double temp;
  @JsonKey(name: 'temp_min')
  double tempMin;
  @JsonKey(name: 'temp_max')
  double tempMax;
  double pressure;
  double humidity;

  Temprature(this.temp, this.tempMin, this.tempMax, this.pressure, this.humidity);

  factory Temprature.fromJson(Map<String, dynamic> json) => _$TempratureFromJson(json);
  Map<String, dynamic> toJson() => _$TempratureToJson(this);
}