import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sisterslabsecond/presentation/bloc/counter_bloc.dart';
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
    return MaterialApp(
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
    );
  }
}
