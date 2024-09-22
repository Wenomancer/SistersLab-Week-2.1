import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'main_controller.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Main Page')),
      body: ChangeNotifierProvider(
        create: (context) => MainPageController(),
        child: _Page(),
      ),
    );
  }
}

class _Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var controller = Provider.of<MainPageController>(context);
    return Center(
      child: ElevatedButton(onPressed: () {
        controller.logout();
      }, child: Text("logout")),
    );
  }
}
