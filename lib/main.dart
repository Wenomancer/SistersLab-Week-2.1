import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sisterslabsecond/presentation/home_screen.dart';

void main() {
  runApp(MyView());
}

class MyView extends StatefulWidget {
  const MyView({super.key});

  @override
  State<MyView> createState() {
    return _MyViewState();
  }
}

class _MyViewState extends State<MyView> {
  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );

    /*
      MaterialApp(
      debugShowCheckedModeBanner: false,
      home:/* MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => HomeController()),
        ],
        child: const HomeScreen(),
      ),*/
          BlocProvider(
        create: (context) => CounterBloc(),
        child: const HomeScreen(),
      ),
    );*/
  }
}
