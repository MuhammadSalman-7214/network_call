import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:networkcall/loading_indicator.dart';
import 'package:networkcall/temprature_widget.dart';
import 'package:networkcall/tempraturestate/temprature_bloc.dart';
import 'package:networkcall/tempraturestate/temprature_event.dart';
import 'package:networkcall/tempraturestate/temprature_state.dart';

class SimpleBlocDelegate extends BlocDelegate {
  @override
  void onEvent(Bloc bloc, Object event) {
    print(event);
    super.onEvent(bloc, event);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    print(transition);
    super.onTransition(bloc, transition);
  }

  @override
  void onError(Bloc bloc, Object error, StackTrace stackTrace) {
    print(error);
    super.onError(bloc, error, stackTrace);
  }
}

//void main() => runApp(MyApp());

void main() {
  BlocSupervisor.delegate = SimpleBlocDelegate();
  runApp(
    BlocProvider<TempratureBloc>(
      create: (context) {
        return TempratureBloc()..add(TempratureApiEvent(city: "Lahore"));
      },
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //home: TempratureWidget(),
      home: BlocBuilder<TempratureBloc , TempratureState>(
      builder: (context , state) {
        if (state is TempratureInProgress) {
          return LoadingIndicator();
        }

        if (state is TempratureSuccessful) {
          return TempratureView(response: state.tempratureResponse,);
        }
      },

      ),
    );
  }
}




