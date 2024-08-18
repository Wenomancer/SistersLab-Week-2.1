import 'package:flutter/material.dart';

class HomeDetailView extends StatefulWidget {
  const HomeDetailView({super.key});

  @override
  State<HomeDetailView> createState() => _HomeDetailViewState();
}

class _HomeDetailViewState extends State<HomeDetailView> {


  @override
  void initState() {
    super.initState();
    print("xxxxxxx i am initialized");
  }

  @override
  void dispose() {
    super.dispose();
    print("xxxxxxx i am disposed");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text('Home Detail View'),
      ),
      body: const Center(
        child: Text('Home Detail View'),
      ),
    );
  }
}
