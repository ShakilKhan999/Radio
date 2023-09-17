import 'dart:convert';
import 'package:flutter/cupertino.dart';
import '../models/news_model.dart';
import 'package:http/http.dart' as http;

class NewsApiProvider extends ChangeNotifier {
  List<News>? _dataList;
  List<CategoryName>? _category;
  bool _isLoading = true;
  bool _isLoadingCat = true;

  List<News>? get dataList => _dataList;
  List<CategoryName>? get category => _category;
  bool get isLoading => _isLoading;
  bool get isLoadingCat => _isLoadingCat;

  final String apiUrl = 'http://devtriples.pythonanywhere.com/api/v1/posting/news_posting_list/'; // Replace with your API endpoint
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
      _dataList = jsonList.map((json) => News.fromJson(json)).toList();
    }

    _isLoading = false;
    notifyListeners();
  }


  Future<void> fetchDataCategoryBasedNews(int index) async {
     String api = 'http://devtriples.pythonanywhere.com/api/v1/posting/news_posting_by_category/$index/'; // Replace with your API endpoint
    _isLoading = true;

    final response = await http.get(
      Uri.parse(api),
      headers: {
        'Authorization': 'Bearer $authToken',
      },
    );

    print('>>>>>>>>>>>>>>>fetch with data ${response.statusCode}');

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonData = jsonDecode(response.body);
      final List<dynamic> jsonList = jsonData['results'];
      _dataList = jsonList.map((json) => News.fromJson(json)).toList();
    }

    _isLoading = false;
    notifyListeners();
  }

  Future<void> fetchCategory() async {
    String api = 'http://devtriples.pythonanywhere.com/api/v1/posting/news_posting_category_list/'; // Replace with your API endpoint
    _isLoadingCat = true;

    final response = await http.get(
      Uri.parse(api),
      headers: {
        'Authorization': 'Bearer $authToken',
      },
    );

    print('>>>>>>>>>>>>>>>fetch category ${response.statusCode}');

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonData = jsonDecode(response.body);
      final List<dynamic> jsonList = jsonData['results'];
      _category = jsonList.map((json) => CategoryName.fromJson(json)).toList();
    }

    _isLoadingCat = false;
    notifyListeners();
  }


  Future<void> sendDataToApi(CreateNewsModel formData) async {
    String authToken =  'dd88a40d63b744b9f777f03aad98b7460048f06a';
    final url = Uri.parse('http://devtriples.pythonanywhere.com/api/v1/posting/news_posting/create/');

    final request = http.MultipartRequest('POST', url);
    request.fields['category'] = formData.category;
    request.fields['user'] = formData.user;
    request.fields['title'] = formData.title;
    request.fields['subtitle'] = formData.subtitle;
    request.fields['description'] = formData.description;

    final file = await http.MultipartFile.fromPath('image', formData.image.path);
    request.files.add(file);

    // Include the authorization token in the headers
    request.headers['Authorization'] = 'Bearer $authToken';

    final response = await request.send();
    print('>>>>>>>>>>>>>>>>>${response.statusCode}');
    if (response.statusCode == 200) {
      // Success, you can handle the response here
    } else {
      // Handle the error
      print('Error sending data to API: ${response.reasonPhrase}');
    }
  }

}


