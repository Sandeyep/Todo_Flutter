import 'dart:developer';

import 'package:get/get.dart';

import '../model/user.dart';
import '../repository/apiservice.dart';

class UserController extends GetxController {
  RxList<UserModel> userList = <UserModel>[].obs;
  RxBool isLoading = false.obs;
  RxString errormessage = "".obs;

  @override
  void onInit() {
    fetchUsers();
    super.onInit();
  }

  void fetchUsers() async {
    isLoading.value = true;
    try {
      var data = await apiService.getUsers();
      userList.value = data;
      log(data.toString());
    } catch (e) {
      errormessage.value = e.toString();
      Get.snackbar("Error", "Failed to fetch users");
    } finally {
      isLoading.value = false;
    }
  }

  void addUser(UserModel user) async {
    try {
      final newUser = await apiService.createUser(user);
      userList.add(newUser);
      Get.back();
    } catch (e) {
      errormessage.value = e.toString();

      Get.snackbar("Error", "Failed to add user");
    }
  }

  void updateUser(int id, UserModel user) async {
    try {
      final updated = await apiService.updateUser(id, user);
      final index = userList.indexWhere((u) => u.id == id);
      if (index != -1) userList[index] = updated;
      Get.back();
    } catch (r) {
      errormessage.value = r.toString();

      Get.snackbar("Error", "Failed to update user");
    }
  }

  void deleteUser(int id) async {
    try {
      await apiService.deleteUser(id);
      userList.removeWhere((u) => u.id == id);
    } catch (e) {
      errormessage.value = e.toString();
      Get.snackbar("Error", "Failed to delete user");
    }
  }
}