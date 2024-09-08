import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:sisterslabsecond/data/repository/RepositoryImpl.dart';

import '../../data/datasource/network/ApiClient.dart';
import '../../data/model/post_model/Post_model.dart';
import '../../domain/repository/Repository.dart';
import 'package:http/http.dart' as http;

class PostController extends ChangeNotifier {
  late ApiClient apiClient;
  late Repository _repository;
  late http.Client client;

  bool loading = false;
  List<PostModel> posts = [];

  void init() async {
    client = http.Client();
    apiClient = ApiClient(client: client);
    _repository = RepositoryImpl(apiClient);
    await fetchPosts();
  }

  void postPost(PostModel post) async {
    loading = true;
    notifyListeners();
    posts = await RepositoryImpl(apiClient).postPost(post);
    loading = false;
    notifyListeners();
  }

  Future<void> fetchPosts() async {
    loading = true;
    notifyListeners();
    posts = await RepositoryImpl(apiClient).getAllPosts();
    loading = false;
    notifyListeners();
  }

}