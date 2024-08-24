import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../viewmodel/home_viewmodel.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomeViewmodel(),
      child: Body(),
    );
  }
}

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    //HomeViewmodel viewModel = Provider.of<HomeViewmodel>(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(),
        const Text("Home View"),
        Consumer(
          builder: (context, HomeViewmodel viewModel, child) {
            return Text("Counter: ${viewModel.counter}");
          },
        ),
        //Text("Counter: ${viewModel.counter}"),  //open with line 38
        ElevatedButton(
          onPressed: () {
            //viewModel.incrementCounter();
            Provider.of<HomeViewmodel>(context).incrementCounter();
          },
          child: const Text("Increment"),
        ),
      ],
    );
  }
}
