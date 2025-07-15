import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/usercontroller.dart';
import 'add_user_screen.dart';

class UserListScreen extends StatefulWidget {
  const UserListScreen({super.key});

  @override
  State<UserListScreen> createState() => _UserListScreenState();
}

class _UserListScreenState extends State<UserListScreen> {
  final UserController controller = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Users")),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.to(() => AddUserScreen()),
        child: Icon(Icons.add),
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return Center(child: CircularProgressIndicator(color: Colors.white));
        }
        if (controller.errormessage.value != '') {
          return Text(controller.errormessage.value);
        }

        return ListView.builder(
          itemCount: controller.userList.length,
          itemBuilder: (context, index) {
            final user = controller.userList[index];
            return ListTile(
              title: Row(children: [Text(user.id.toString()), Text(user.name)]),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: Icon(Icons.edit),
                    onPressed: () => Get.to(() => AddUserScreen(user: user)),
                  ),
                  IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () => controller.deleteUser(user.id),
                  ),
                ],
              ),
            );
          },
        );
      }),
    );
  }
}