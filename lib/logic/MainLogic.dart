

import 'package:flutter/material.dart';

void myDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Popup Başlığı'),
        content: Text('Bu bir popup mesajıdır.'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('Kapat'),
          ),
        ],
      );
    },
  );
}

void onLoginPressed({
  required TextEditingController controllerOne,
  required TextEditingController controllerTwo,
  required String username,
  required String password,
  required BuildContext context,
}) {
  if (controllerOne.text != username) {
    print("wrong username");
  } else {
    print("correct username");
  }
  if (controllerTwo.text != password) {
    print("wrong password");
  } else {
    print("correct password");
  }
  myDialog(context);
}