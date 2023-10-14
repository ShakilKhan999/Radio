import '../models/radio_model.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class RadioRepository{

  Future<List<RadioStation>> fetchRadioStations() async {
    print("getchannell234234");
    var headers = {
      'Authorization': 'Bearer e0e6b09f5a9b9734c44d039ea02d7630adee76d9',
    };
    var url = Uri.parse('http://16.171.2.83/api/v1/posting/radio_station_list/');
    var request = http.Request('GET', url);
    request.headers.addAll(headers);
    try {
      final response = await request.send();

      if (response.statusCode == 200) {
        print("getchannell234478654");
        final jsonData = json.decode(await response.stream.bytesToString());
        final List< dynamic> results = jsonData['results'];
        print(results.toString());

        // Convert the JSON data to a list of RadioStation objects
        final List<RadioStation> radioStations = results
            .map((station) => RadioStation.fromJson(station))
            .toList();

        return radioStations;
      } else {
        throw Exception('Failed to fetch data');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}