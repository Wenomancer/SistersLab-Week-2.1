import 'package:colours/colours.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:sisterslabsecond/presentation/pages/page_util.dart';
import 'package:sisterslabsecond/presentation/user_page/UserController.dart';
import 'package:sisterslabsecond/presentation/user_page/UserPage.dart';
import 'package:sisterslabsecond/main_controller.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => MainController(),
      child: MyView(),
    ),
  );
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
    MainController controller = Provider.of<MainController>(context);
    //MainController controller = context.watch<MainController>();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepOrange,
          secondary: Colours.blueGrey.shade100,
          primary: Colors.blueGrey,
          error: Colors.red,
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueGrey,
          title: Text(
            appPageNames[controller.currentIndex],
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: [
            if(controller.currentIndex == AppPageType.PostPage.index) IconButton(
              onPressed: () {},
              icon: const FaIcon(
                FontAwesomeIcons.circlePlus,
                color: Colors.white,
              ),
            )
          ],
          centerTitle: true,
          shadowColor: Colors.blueGrey,
          elevation: 5,
        ),
        body: appPages[controller.currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.user),
              label: "Users",
            ),
            BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.signsPost),
              label: "Posts",
            ),
          ],
          backgroundColor: Colors.blueGrey,
          elevation: 5,
          onTap: (index) {
            controller.changePage(index);
          },
          currentIndex: controller.currentIndex,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey,
          type: BottomNavigationBarType.fixed,
        ),
      ),
    );
  }
}
