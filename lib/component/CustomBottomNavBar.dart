import 'package:flutter/material.dart';

class CustomBottomNavBar extends StatefulWidget {

  final void Function(int) bottomNavBarCallback;
  const CustomBottomNavBar({super.key, required this.bottomNavBarCallback });

  @override
  State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {

  int index = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      unselectedItemColor: Colors.grey,
      type: BottomNavigationBarType.fixed,
      currentIndex: index,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.business),
          label: 'Business',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.school),
          label: 'School',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.book),
          label: 'Library',
        ),
      ],
      selectedItemColor: Colors.amber[800],
      onTap: (int i) {
        setState(() {
          index = i;
        });
        widget.bottomNavBarCallback(index);
      },
    );
  }
}
