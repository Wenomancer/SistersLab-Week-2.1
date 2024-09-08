import 'package:flutter/material.dart';
import '../post_page/post_page.dart';
import '../user_page/UserPage.dart';

List<Widget> appPages = [
  UserPage(),
  PostPage(),
];

enum AppPageType {
  UserPage,
  PostPage,
}

List<String> appPageNames = [
  "User Page",
  "Post Page",
];