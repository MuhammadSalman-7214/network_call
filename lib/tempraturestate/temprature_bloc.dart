import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:networkcall/models/tempratureresponse.dart';
import 'package:networkcall/temprature_service.dart';
import 'package:networkcall/tempraturestate/temprature_event.dart';
import 'package:networkcall/tempraturestate/temprature_state.dart';

class TempratureBloc extends Bloc<TempratureEvent , TempratureState> {

  @override
  TempratureState get initialState => TempratureInProgress();

  @override
  Stream<TempratureState> mapEventToState(TempratureEvent event)
  async*
  {
    if(event is TempratureApiEvent) {
      yield TempratureInProgress();
      TempratureResponse tempratureResponse = await TempratureAPIService.fetchTemprature(event.city);
      yield TempratureSuccessful(tempratureResponse: tempratureResponse);
    }
  }

}