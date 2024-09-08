import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sisterslabsecond/presentation/post_page/post_controller.dart';
import 'package:sisterslabsecond/presentation/user_page/UserController.dart';

class PostPage extends StatefulWidget {
  PostPage({super.key});

  @override
  State<PostPage> createState() => _UserPageState();
}

class _UserPageState extends State<PostPage> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => PostController()..init(),
      child: Consumer<PostController>(builder: (context, controller, child) {
          if (controller.loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (controller.posts.isEmpty) {
            return Center(
              child: InkWell(
                  child: Text("No users found"),
                  onTap: () {
                    controller.init();
                  }
              ),
            );
          } else {
            return  Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: controller.posts.length,
                    itemBuilder: (context, index) {
                      final post = controller.posts[index];
                      return ListTile(
                        title: Text(post.userId.toString()),
                        subtitle: Text(post.body ?? "not found"),
                      );
                    },
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    controller.init();
                  },
                  child: Text("Fetch Users"),
                )
              ],
            );
          }
      }),
    );
  }
}
