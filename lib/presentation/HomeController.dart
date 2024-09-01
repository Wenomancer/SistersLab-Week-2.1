import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:logger/logger.dart';
import 'package:sisterslabsecond/model/WeatherInfoModel.dart';
import 'package:sisterslabsecond/network/ApiClient.dart';

class HomeController extends ChangeNotifier {
  Client httpClient = Client();
  late ApiClient apiClient;
  late WeatherInfoModel weatherInfoModel;

  init() {
    apiClient = ApiClient(httpClient: httpClient);
    fetchWeatherInfo();
  }

  void fetchWeatherInfo() async {
    await apiClient.get("41.015%2C28.97").then((response) {
      if(response != null) {
        Logger().i('Response: ${response.body}');
        Map<String, dynamic> body = jsonDecode(response.body);
        weatherInfoModel = WeatherInfoModel.fromJson(body);
        Logger().d('Location: ${weatherInfoModel.location!.name}');
        notifyListeners();
      } else {
        Logger().e('Failed to fetch weather info.');
      }
    });

  }
}