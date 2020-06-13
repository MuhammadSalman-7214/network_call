import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:networkcall/models/tempratureresponse.dart';
import 'package:networkcall/temprature_service.dart';
import 'package:networkcall/tempraturestate/temprature_bloc.dart';
import 'package:networkcall/tempraturestate/temprature_event.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TempratureWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Temprature'),
        actions: <Widget>[
          new IconButton(
            icon: new Icon(Icons.refresh),
            onPressed: () {
              print("Refresh Button Clicked");
              FutureBuilder<TempratureResponse>(
                future: TempratureAPIService.fetchTemprature("Lahore"),
                builder: (context, state) {
                  print(state.hasError);
                  if (state.hasError) print(state.error);

                  return state.hasData
                      ? TempratureView(
                          response: state.data,
                        )
                      : Center(child: CircularProgressIndicator());
                },
              );
            },
          ),
        ],
      ),
      body: FutureBuilder<TempratureResponse>(
        future: TempratureAPIService.fetchTemprature("Lahore"),
        builder: (context, state) {
          print(state.hasError);
          if (state.hasError) print(state.error);

          return state.hasData
              ? TempratureView(
                  response: state.data,
                )
              : Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}

class TempratureView extends StatefulWidget {
  final TempratureResponse response;

  TempratureView({Key key, this.response}) : super(key: key);

  Temprature createState() => Temprature(response: response);
}

class Temprature extends State<TempratureView> {
  final TempratureResponse response;

  String city = "Lahore";
  List<String> locations = ["Lahore", "Karachi" , "Islamabad"];

  Temprature({this.response});

  @override
  void initState() {
    super.initState();
    getCityValue();
  }

  getCityValue() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      city = prefs.getString("city") ?? "Lahore";
    });
  }

  void setCityValue(String city) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      prefs.setString("city", city);
    });
  }

  @override
  Widget build(BuildContext context) {
    final dropdownMenuOptions = locations
        .map((String item) =>
            new DropdownMenuItem<String>(value: item, child: new Text(item)))
        .toList();

    return WillPopScope(
      onWillPop: () {
        setCityValue("Lahore");
        return Future.value(true);
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Temprature'),
          actions: <Widget>[
            new IconButton(
              icon: new Icon(Icons.refresh),
              onPressed: () {
                print("Refresh Button Clicked");
                BlocProvider.of<TempratureBloc>(context)
                    .add(TempratureApiEvent(city: city));
              },
            ),
          ],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              DropdownButton<String>(
                  value: city,
                  items: dropdownMenuOptions,
                  onChanged: (s) {
                    setState(() {
                      city = s;
                      setCityValue(s);
                    });
                    BlocProvider.of<TempratureBloc>(context)
                        .add(TempratureApiEvent(city: city));
                  }),
              Text(
                "${response.temprature.temp - 273.15}" + "°C",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("${response.temprature.tempMin - 273.15}"),
                  Text(" - "),
                  Text("${response.temprature.tempMax - 273.15}" + "°C")
                ],
              ),
              Text(city),
              Text("PK")
            ],
          ),
        ),
      ),
    );
  }
}
