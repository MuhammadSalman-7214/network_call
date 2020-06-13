import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class TempratureEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class TempratureApiEvent extends TempratureEvent {
  final String city;

  TempratureApiEvent({@required this.city}) : assert(city != null);

  @override
  List<Object> get props => [city];
}