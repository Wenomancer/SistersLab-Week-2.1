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
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Column(
          children: [
            Text("Hello World!"),
            Text("ilayda burdaydı"),
            Container(
              height: 200,
              color: Colors.red,
              child: Center(
                child: Text('Container 1'),
              ),
            ),
            Container(
              height: 200,
              color: Colors.green,
              child: Center(
                child: Text('Container 2'),
              ),
            ),
            Container(
              height: 200,
              color: Colors.blue,
              child: Center(
                child: Text('Container 3'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
