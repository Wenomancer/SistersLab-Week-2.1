import 'package:colours/colours.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sisterslabsecond/presentation/user_page/UserController.dart';

class UserPage extends StatefulWidget {
  UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ChangeNotifierProvider(
      create: (context) => UserController()..init(),
      child: Consumer<UserController>(
        builder: (context, controller, child) {
          if (controller.loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (controller.users.isEmpty) {
            return Center(
              child: InkWell(
                  child: Text("No users found"),
                  onTap: () {
                    controller.init();
                  }),
            );
          } else {
            return Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 5,
                vertical: 10,
              ),
              child: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: controller.users.length,
                      itemBuilder: (context, index) {
                        final user = controller.users[index];
                        return Card(
                            color: theme.colorScheme.secondary,
                            elevation: 5,
                            child: Container(
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  RichText(
                                    text: TextSpan(
                                      style: const TextStyle(
                                        fontSize: 14.0,
                                        color: Colors.black,
                                      ),
                                      children: <TextSpan>[
                                        TextSpan(text: 'User name: '),
                                        TextSpan(
                                            text:
                                                "${user.name ?? "User not found"} ",
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold, color: Colors.red)),
                                      ],
                                    ),
                                  ),
                                  Text(user.email ?? "eMail not found"),
                                  Text(user.phone ?? "Phone not found"),
                                  Text(user.website ?? "Website not found"),
                                  Text(user.company?.name ??
                                      "Company not found"),
                                  Text(user.company?.catchPhrase ??
                                      "Catch Phrase not found"),
                                  Text(user.company?.bs ?? "BS not found"),
                                  Text(user.address?.street ??
                                      "Street not found"),
                                  Text(
                                      user.address?.suite ?? "Suite not found"),
                                  Text(user.address?.city ?? "City not found"),
                                  Text(user.address?.zipcode ??
                                      "Zipcode not found"),
                                  Text(user.address?.geo?.lat ??
                                      "Latitude not found"),
                                  Text(user.address?.geo?.lng ??
                                      "Longitude not found"),
                                ],
                              ),
                            )

                            /*ListTile(
                            title: Text(user.name ?? "Name not found"),
                            subtitle: Text(user.email ?? "eMail not found"),
                          ),*/
                            );
                      },
                    ),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
