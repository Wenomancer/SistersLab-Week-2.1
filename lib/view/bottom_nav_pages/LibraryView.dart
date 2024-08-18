import 'package:flutter/material.dart';
import 'package:sisterslabsecond/view/detail_views/LibraryDetailView.dart';

class LibraryView extends StatelessWidget {
  const LibraryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.yellow,
      child: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const LibraryDetailView()),
            );
          },
          child: const Text('Go to LibraryDetailView'),
        ),
      ),
    );
  }
}