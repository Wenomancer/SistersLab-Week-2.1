import 'package:flutter/material.dart';
import 'package:sisterslabsecond/view/detail_views/HomeDetailView.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const HomeDetailView()),
            );
          },
          child: const Text('Go to HomeDetailView'),
        ),
      ),
    );
  }
}