import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final void Function() menuButtonOnPressed;
  final void Function() addButtonOnPressed;
  final void Function() removeButtonOnPressed;

  const CustomAppBar({
    super.key,
    required this.menuButtonOnPressed,
    required this.addButtonOnPressed,
    required this.removeButtonOnPressed,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 10,
      shadowColor: Colors.black,
      backgroundColor: Colors.blue,
      leading: IconButton(
        icon: const Icon(Icons.menu),
        onPressed: () {
          menuButtonOnPressed();
        },
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.add),
          onPressed: () {
            addButtonOnPressed();
          },
        ),
        IconButton(
          icon: const Icon(Icons.remove),
          onPressed: () {
            removeButtonOnPressed();
          },
        ),
      ],
      title: const Center(child: Text('My View')),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
