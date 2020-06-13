import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:networkcall/models/tempratureresponse.dart';

abstract class TempratureState extends Equatable{

  @override
  List<Object> get props => [];
}

class TempratureInProgress extends TempratureState {}

class TempratureSuccessful extends TempratureState {
  final TempratureResponse tempratureResponse;

  TempratureSuccessful({@required this.tempratureResponse}): assert(tempratureResponse != null);

  @override
  List<Object> get props => [tempratureResponse];
}