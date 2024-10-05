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
      home: SafeArea(
        child: DefaultTabController(
          length: 2,
          child: Scaffold(
            appBar: AppBar(
              title: Text("TabBar Example"),
              centerTitle: true,
              backgroundColor: Colors.blue,
            ),
            body: Column(
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  child: TabBar(
                    tabs: const [
                      Tab(
                        text: 'Home',
                      ),
                      Tab(
                        text: 'Settings',
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: TabBarView(children: [
                    Container(
                      color: Colors.blueGrey,
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            MyButtonOne(),
                            const SizedBox(height: 20),
                            MyCardButton(),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      color: Colors.green,
                      child: Center(
                        child: Text("Settings Page"),
                      ),
                    ),
                  ]),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MyButtonOne extends StatelessWidget {
  const MyButtonOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
            color: Colors.blue,
            blurRadius: 10.0,
            offset: Offset(-5, 5),
          ),
          BoxShadow(
            color: Colors.red,
            blurRadius: 10.0,
            offset: Offset(-5, 5),
          ),
          BoxShadow(
            color: Colors.green,
            blurRadius: 10.0,
            offset: Offset(-5, 5),
          ),
        ],
        gradient: const LinearGradient(
          colors: [
            Colors.blue,
            Colors.red,
            Colors.green,
          ],
        ),
        border: Border.all(
          color: Colors.black,
          width: 0.5,
        ),
      ),
      child: Text("Home Page"),
    );
  }
}

class MyCardButton extends StatelessWidget {
  const MyCardButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Text("Home Page"),
      ),
      shadowColor: Colors.black,
      elevation: 10,
      //surfaceTintColor: Colors.blue,
      color: Colors.blue.shade50
    );
  }
}
