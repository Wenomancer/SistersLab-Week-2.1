import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sisterslabsecond/add_task/presentation/add_task_page.dart';
import 'package:sisterslabsecond/home/presentation/home_page.dart';
import 'auth/presentation/create_account/create_account_page.dart';
import 'auth/presentation/login/login_page.dart';
import 'firebase_options.dart';
import 'main_controller.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    ChangeNotifierProvider(
      create: (context) {
        return MainController()..checkUserSignedIn();
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
      debugShowCheckedModeBanner: false,
      routes: {
        '/login': (context) => const LoginPage(),
        '/create-account': (context) => const CreateAccountPage(),
        '/addTask': (context) => const AddTaskPage(),
        '/home': (context) => const HomePage(),
      },
      home: Consumer(
        builder: (context, MainController mainController, child) {
          return mainController.firstPage;
        },
      ),
    );
  }
}
