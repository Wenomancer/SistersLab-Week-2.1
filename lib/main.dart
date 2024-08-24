import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sisterslabsecond/component/CustomAppBar.dart';
import 'package:sisterslabsecond/presentation/home/view/home_view.dart';
import 'package:sisterslabsecond/presentation/search/view/search_view.dart';
import 'package:sisterslabsecond/presentation/settings/view/settings_view.dart';

import 'main_viewmodel.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => MainViewModel(),
      child: MyView(),
    ),
  );
}

class MyView extends StatelessWidget {
  const MyView({super.key});

  @override
  Widget build(BuildContext context) {
    MainViewModel viewModel = Provider.of<MainViewModel>(context);

    List pages = const [
      HomeView(),
      SearchView(),
      SettingsView(),
    ];

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: CustomAppBar(
          addButtonOnPressed: () {},
          removeButtonOnPressed: () {},
          menuButtonOnPressed: () {},
        ),
        body: pages[viewModel.selectedPageIndex],
        bottomNavigationBar: BottomNavigationBar(
          onTap: (value) {
            viewModel.setSelectedPageIndex(value);
          },
          currentIndex: viewModel.selectedPageIndex,
          selectedItemColor: Colors.blue,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: "Search",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: "Settings",
            ),
          ],
        ),
      ),
    );
  }
}
