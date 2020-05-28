import 'package:flutter/material.dart';
import 'package:networkcall/models/tempratureresponse.dart';
import 'package:networkcall/temprature_service.dart';

class TempratureWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Temprature'),
        actions: <Widget>[
          new IconButton(
            icon: new Icon(Icons.refresh),
            onPressed: (){
              print("Refresh Button Clicked");
              FutureBuilder<TempratureResponse>(
                future: TempratureAPIService.fetchTemprature(),
                builder: (context, state) {
                  print(state.hasError);
                  if (state.hasError) print(state.error);

                  return state.hasData
                      ? TempratureView(response: state.data,)
                      : Center(child: CircularProgressIndicator());
                },
              );
            },
          ),
        ],
      ),
      body: FutureBuilder<TempratureResponse>(
        future: TempratureAPIService.fetchTemprature(),
        builder: (context, state) {
          print(state.hasError);
          if (state.hasError) print(state.error);

          return state.hasData
              ? TempratureView(response: state.data,)
              : Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}

class TempratureView extends StatelessWidget {
  final TempratureResponse response;

  TempratureView({Key key, this.response}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
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
            Text("Lahore"),
            Text("PK")
          ],
        ),
      ),
    );
  }
}
