import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'auth/presentation/create_account_page.dart';
import 'auth/presentation/login_page.dart';
import 'firebase_options.dart';
import 'main_controller.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Ideal time to initialize
  await FirebaseAuth.instance.useAuthEmulator('localhost', 9099);

  runApp(
    ChangeNotifierProvider(
      create: (context) {
        return MainController()..init();
      },
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/login': (context) => const LoginPage(),
        '/create-account': (context) => const CreateAccountPage(),
      },
      home: Consumer(
        builder: (context, MainController mainController, child) {
          return mainController.firstPage;
        },
      ),
    );
  }
}
