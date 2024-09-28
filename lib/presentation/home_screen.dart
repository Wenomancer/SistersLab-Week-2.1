import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'bloc/counter_bloc.dart';
import 'bloc/counter_event.dart';
import 'bloc/counter_state.dart';
import 'getx_controller/getx_counter_controller.dart';
import 'provider_controller/home_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //var providerController = Provider.of<HomeController>(context);
    //var bloc = Provider.of<CounterBloc>(context);

    return GetxUi();
  }
}

class GetxUi extends StatelessWidget {
  GetxUi({super.key});

  var controller = Get.put(GetxCounterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bloc"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            GetX<GetxCounterController>(
              builder: (_) => Text(
                'clicks: ${controller.counter}',
              ),
            ),
            Obx(
              () => Text('clicks: ${controller.counter}'),
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              controller.increment();
            },
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
          const SizedBox(width: 10),
          FloatingActionButton(
            onPressed: () {
              controller.decrement();
              Get.bottomSheet(
                Container(
                  width: double.infinity,
                  color: Colors.white,
                  child: Column(
                    children: [
                      Text('clicks: ${controller.counter}'),
                      ElevatedButton(
                        onPressed: () {
                          Get.back();
                        },
                        child: Text('Close'),
                      ),
                    ],
                  ),
                ),
              );
            },
            tooltip: 'Decrement',
            child: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}

class BlocUi extends StatelessWidget {
  const BlocUi({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CounterBloc, CounterState>(
      builder: (context, CounterState state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("Bloc"),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'You have pushed the button this many times:',
                ),
                Text(
                  '${state.value}',
                ),
              ],
            ),
          ),
          floatingActionButton: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FloatingActionButton(
                onPressed: () {
                  context.read<CounterBloc>().add(Increment());
                },
                tooltip: 'Increment',
                child: const Icon(Icons.add),
              ),
              const SizedBox(width: 10),
              FloatingActionButton(
                onPressed: () {
                  context.read<CounterBloc>().add(Decrement());
                },
                tooltip: 'Decrement',
                child: const Icon(Icons.remove),
              ),
            ],
          ),
        );
      },
    );
  }
}

class ProviderUi extends StatelessWidget {
  const ProviderUi({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeController>(
      builder: (context, HomeController providerController, child) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("Bloc"),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'You have pushed the button this many times:',
                ),
                Text(
                  '${providerController.counterState}',
                ),
              ],
            ),
          ),
          floatingActionButton: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FloatingActionButton(
                onPressed: () {
                  providerController.increment();
                  //context.read<HomeController>().increment();
                },
                tooltip: 'Increment',
                child: const Icon(Icons.add),
              ),
              const SizedBox(width: 10),
              FloatingActionButton(
                onPressed: () {
                  providerController.decrement();
                  //context.read<HomeController>().decrement();
                },
                tooltip: 'Decrement',
                child: const Icon(Icons.remove),
              ),
            ],
          ),
        );
      },
    );
  }
}
