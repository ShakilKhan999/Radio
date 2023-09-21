import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../global/constants.dart';
import '../models/upcoming_show_model.dart';

class UpcomingShowProvider extends ChangeNotifier {
  List<UpcomingShow> _upcomingShows = [];
  bool _isLoading = true;

  List<UpcomingShow> get upcomingShows => _upcomingShows;
  bool get isLoading => _isLoading;

  final String apiUrl =
      '${baseUrl}api/v1/posting/upcoming_show_list/';
  final String authToken =
      'dd88a40d63b744b9f777f03aad98b7460048f06a';

  Future<void> fetchUpcomingShows() async {
    _isLoading = true;

    final response = await http.get(
      Uri.parse(apiUrl),
      headers: {
        'Authorization': 'Bearer $authToken',
      },
    );

    if (response.statusCode == 200) {
      final List<dynamic> jsonList = jsonDecode(response.body)['results'];
      _upcomingShows = jsonList.map((json) => UpcomingShow.fromJson(json)).toList();
    }

    _isLoading = false;
    notifyListeners();
  }


}


class ApiProvider extends ChangeNotifier {
  List<Results>? _dataList;
  bool _isLoading = true;

  List<Results>? get dataList => _dataList;
  bool get isLoading => _isLoading;

  final String apiUrl = '${baseUrl}api/v1/posting/audio_posting_by_category/1/'; // Replace with your API endpoint
  final String authToken = 'dd88a40d63b744b9f777f03aad98b7460048f06a'; // Replace with your authentication token

  Future<void> fetchData() async {
    _isLoading = true;

    final response = await http.get(
      Uri.parse(apiUrl),
      headers: {
        'Authorization': 'Bearer $authToken',
      },
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonData = jsonDecode(response.body);
      final List<dynamic> jsonList = jsonData['results'];
      _dataList = jsonList.map((json) => Results.fromJson(json)).toList();
    }

    _isLoading = false;
    notifyListeners();
  }
}



