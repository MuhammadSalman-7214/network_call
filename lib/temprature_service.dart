
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:networkcall/models/tempratureresponse.dart';
import 'package:http/http.dart' as http;

class TempratureAPIService {

  static Future<TempratureResponse> fetchTemprature() async {

    final response =
    await http.get("http://api.openweathermap.org/data/2.5/weather?q=Lahore&appid=55071231b3b046ed9d252d8733391b6b");

    //return parseTemprature(response.body);
    return compute(parseTemprature, response.body);
  }

  static TempratureResponse parseTemprature(String responseBody) {
    final parsed = jsonDecode(responseBody) as Map<String, dynamic>;
    return TempratureResponse.fromJson(parsed);
  }
}