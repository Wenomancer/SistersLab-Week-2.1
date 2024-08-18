import 'package:flutter/material.dart';
import 'package:sisterslabsecond/view/detail_views/SchoolDetailView.dart';

class SchoolView extends StatelessWidget {
  const SchoolView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
      child: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SchoolDetailView()),
            );
          },
          child: const Text('Go to SchoolDetailView'),
        ),
      ),
    );
  }
}