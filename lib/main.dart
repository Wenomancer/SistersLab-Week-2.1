import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import 'package:logger/logger.dart';
import 'package:sisterslabsecond/model/post_model.dart';

void main() {
  runApp(MyView());
}

class MyView extends StatefulWidget {
  const MyView({super.key});

  @override
  State<MyView> createState() {
    return _MyViewState();
  }
}

class _MyViewState extends State<MyView> {
  String title = "Loading...";
  String body = "Loading...";
  int userId = 8888888;
  int id = 99999999;

  @override
  Widget build(BuildContext context) {
    testApi().then((value) {
      if (value != null) {
        setState(() {
          title = value[0].title;
          body = value[0].body;
          userId = value[0].userId;
          id = value[0].id;
        });
      }
    });
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(title),
            Text(body),
            Text(userId.toString()),
            Text(id.toString()),
          ],
        ),
      ),
    );
  }
}

Future<List<PostModel>?> testApi() async {
  List<PostModel> posts = [];

  try {
    var url = Uri.parse('https://jsonplaceholder.typicode.com/posts');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      posts = (convert.jsonDecode(response.body) as List)
          .map((data) => PostModel.fromJson(data))
          .toList();

      Logger().d(posts[0].title);
      return posts;

    } else {
      print('Request failed with status: ${response.statusCode}.');
      Logger().d('Request failed with status: ${response.statusCode}.');
    }
  } on FormatException catch (e) {
    print('FormatException caught: $e');
    Logger().e('FormatException caught: $e');
  } catch (e) {
    Logger().e('Exception: $e');
  }
  return null;
}
