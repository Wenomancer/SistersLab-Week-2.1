import 'package:flutter/material.dart';
import 'package:sisterslabsecond/view/detail_views/BusinessDetailView.dart';

class BusinessView extends StatelessWidget {
  const BusinessView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      child: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const BusinessDetailView()),
            );
          },
          child: const Text('Go to BusinessDetailView'),
        ),
      ),
    );
  }
}