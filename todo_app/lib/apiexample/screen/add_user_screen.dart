import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/usercontroller.dart';
import '../model/user.dart';


class AddUserScreen extends StatelessWidget {
  final UserController controller = Get.put(UserController());
  final TextEditingController nameController = TextEditingController();
  final UserModel? user;

  AddUserScreen({super.key, this.user}) {
    if (user != null) {
      nameController.text = user!.name;
    }
  }

  void saveUser() {
    final name = nameController.text.trim();
    if (name.isEmpty) return;

    final newUser = UserModel(id: user?.id ?? 0, name: name);
    if (user == null) {
      controller.addUser(newUser);
    } else {
      controller.updateUser(user!.id, newUser);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(user == null ? "Add User" : "Edit User")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: "Name"),
            ),
            SizedBox(height: 20),
            ElevatedButton(onPressed: saveUser, child: Text("Save")),
          ],
        ),
      ),
    );
  }
}