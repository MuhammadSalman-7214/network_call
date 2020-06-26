import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;
import 'package:networkcall/models/tempratureresponse.dart';
import 'package:networkcall/temprature_service.dart';

// Create a MockClient using the Mock class provided by the Mockito package.
// Create new instances of this class in each test.
class MockClient extends Mock implements http.Client {}

main() {
  //group('fetchPost', () {
    test('returns a Post if the http call completes successfully', () async {
      final client = MockClient();

      // Use Mockito to return a successful response when it calls the
      // provided http.Client.
      when(client.get('http://api.openweathermap.org/data/2.5/weather?q=Lahore&appid=55071231b3b046ed9d252d8733391b6b'))
          .thenAnswer((_) async => http.Response('"main": {"temp": 20, "temp_min": 15, "temp_max": 25 }', 200));
      expect(await TempratureAPIService.fetchTemprature(), isA<TempratureResponse>());
    });
  //});
}