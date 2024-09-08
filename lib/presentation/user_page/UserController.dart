import 'package:flutter/material.dart';
import 'package:sisterslabsecond/data/datasource/network/ApiClient.dart';
import 'package:sisterslabsecond/data/repository/RepositoryImpl.dart';
import 'package:sisterslabsecond/domain/repository/Repository.dart';
import 'package:http/http.dart' as http;

import '../../data/model/user_model/UserModel.dart';

class UserController extends ChangeNotifier {
  late ApiClient apiClient;
  late Repository _repository;
  late http.Client client;
  init() async {
    client = http.Client();
    apiClient = ApiClient(client: client);
    _repository = RepositoryImpl(apiClient);
    await fetchUsers();
  }

  List<UserModel> _users = [];
  bool isLoading = false;

  List<UserModel> get users => _users;
  bool get loading => isLoading;

  Future<void> fetchUsers() async {
    isLoading = true;
    notifyListeners();
    await _repository.getAllUsers().then((value) {
      _users = value;
      isLoading = false;
      notifyListeners();
      return value;
    }).catchError((e) {
      isLoading = false;
      notifyListeners();
    });

  }

}