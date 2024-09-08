import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import 'package:sisterslabsecond/data/model/post_model/Post_model.dart';

import '../../model/user_model/UserModel.dart';

class ApiClient {
  final String baseUrl = "https://api.themoviedb.org/3";
  final http.Client client;

  ApiClient({required this.client});

  Future<List<UserModel>> getUsersFromApi() async {
    final response = await client
        .get(Uri.parse('https://jsonplaceholder.typicode.com/users'));

    if (response.statusCode == 200) {
      List jsonData = json.decode(response.body);
      Logger().i(jsonData);
      return jsonData.map((user) => UserModel.fromJson(user)).toList();
    } else {
      throw Exception('Failed to load users');
    }
  }

  Future<List<PostModel>> getPostsFromApi() async {
    final response = await client
        .get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));

    if (response.statusCode == 200) {
      List jsonData = json.decode(response.body);
      Logger().i(jsonData);
      return jsonData.map((post) => PostModel.fromJson(post)).toList();
    } else {
      throw Exception('Failed to load posts');
    }
  }

  Future<List<PostModel>> postPostToApi(PostModel post) async {
    final response = await client.post(
      Uri.parse('https://jsonplaceholder.typicode.com/posts'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(post.toJson()),
    );

    if (response.statusCode == 201) {
      Logger().i(response.body);
      return [PostModel.fromJson(json.decode(response.body))];
    } else {
      throw Exception('Failed to post post');
    }
  }


}