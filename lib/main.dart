import 'package:flutter/material.dart';

import 'component/MyCustomTextField.dart';
import 'logic/MainLogic.dart';

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
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Center(child: Text('My View Mine')),
        ),
        body: HomeView(),
      ),
    );
  }
}

class HomeView extends StatefulWidget {
  HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  String username = "Jhon Doe";

  String password = "123456";

  TextEditingController controllerOne = TextEditingController();

  TextEditingController controllerTwo = TextEditingController();

  Color bgColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      color: Colors.black,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 1,
            child: Container(
              color: bgColor,
            ),
          ),
          Expanded(
              flex: 1,
              child: Container(
                color: Colors.red,
                child: Column(
                  children: [
                    MyCustomTextField(
                      controller: controllerOne,
                    ),
                    MyCustomTextField(
                      controller: controllerTwo,
                      textColor: Colors.red,
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            bgColor = Colors.purple;
                          });
                        },
                        child: Text("Login"),
                      ),
                    ),
                  ],
                ),
              )),
          Expanded(
            flex: 2,
            child: Container(
              color: Colors.green,
            ),
          ),
        ],
      ),
    );
  }
}


