import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
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

  FirebaseMessaging.onBackgroundMessage(
    (message) {
      // Arka planda bildirim geldiğinde bu fonksiyon çalışır.
      print("Message in the background: ${message.messageId}");
      return Future<void>.value();
    },
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

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    FirebaseMessaging.instance.requestPermission();

    FirebaseMessaging.instance.getToken().then((token) {
      print("FCM Token: $token");
    });

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print('Message received: ${message.notification?.title}');
      if (message.notification != null && mounted) {
        showDialog(
          context: context,
          builder: (_) => AlertDialog(
            title: Text(message.notification!.title ?? 'No Title'),
            content: Text(message.notification!.body ?? 'No Body'),
          ),
        );
      }
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print('A notification was opened: ${message}');
      if (message.data['route'] != null) {
        Navigator.of(context).pushNamed(message.data['route']); // Rotaya git
      }
    });
  }





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