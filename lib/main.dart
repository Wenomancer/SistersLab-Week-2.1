import 'package:flutter/material.dart';
import 'package:sisterslabsecond/component/CustomAppBar.dart';
import 'package:sisterslabsecond/component/CustomBottomNavBar.dart';
import 'package:sisterslabsecond/view/bottom_nav_pages/BusinessView.dart';
import 'package:sisterslabsecond/view/bottom_nav_pages/HomeView.dart';
import 'package:sisterslabsecond/view/bottom_nav_pages/LibraryView.dart';
import 'package:sisterslabsecond/view/bottom_nav_pages/SchoolView.dart';

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
  int pageIndex = 0;

  List bottomNavBarViews = [
    HomeView(),
    BusinessView(),
    SchoolView(),
    LibraryView(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: CustomAppBar(
          addButtonOnPressed: () {},
          removeButtonOnPressed: () {},
          menuButtonOnPressed: () {},
        ),
        body: bottomNavBarViews[pageIndex],
        bottomNavigationBar: CustomBottomNavBar(
          bottomNavBarCallback: (index) {
            setState(() {
              pageIndex = index;
            });
          },
        ),
      ),
    );
  }
}
