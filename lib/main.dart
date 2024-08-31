import 'package:flutter/material.dart';

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
  String data = "Loading...";

  @override
  Widget build(BuildContext context) {

    myFunction().then((value) {
      setState(() {
        data = value;
      });
    });

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
        child: Text(data),
)
      ),
    );
  }
}


Future<String> myFunction() async {
  await Future.delayed(Duration(seconds: 5));
  return "Hello";
}
