import 'package:flutter/material.dart';
import 'package:sisterslabsecond/component/CustomAppBar.dart';

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
  String myText = "xxxxxxx";
  TextEditingController myController = TextEditingController();

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
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: myController,
              ),
              const SizedBox(height: 20),
              Text(
                myText,
                style: TextStyle(fontSize: 30),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    myText = myController.text;
                  });
                },
                child: Text("Click Me"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
