import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

class ApiClient {
  final String baseUrl = "https://weatherapi-com.p.rapidapi.com";
  final String endPoint = "current.json";
  final http.Client httpClient;

  ApiClient({required this.httpClient});

  Future<http.Response?> get(String coordinate) async {
    final response = await httpClient.get(
        Uri.parse('$baseUrl/$endPoint?q=$coordinate'),
        headers: {"X-RapidAPI-Key": "77c134ec51msh7012a1933421856p1b4d26jsnf1292dd00856"});
    if (response.statusCode != 200) {
      Logger().e('Request failed with status: ${response.statusCode}.');
      return null;
    } else {
      return response;
    }
  }
}
