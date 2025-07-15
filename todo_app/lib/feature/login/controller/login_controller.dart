import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:todo_app/api%20test/screen/apitest.dart';
import 'package:todo_app/feature/login/login_screen.dart';
// import 'package:todo_app/home/dashboard.dart';

class LoginController extends GetxController {
  final FirebaseAuth auth = FirebaseAuth.instance;
  late Rx<User?> firebaseUser;

  RxBool isloading = false.obs;
  RxString errorMessage = ''.obs;

  @override
  void onReady() {
    super.onReady();
    firebaseUser = Rx<User?>(auth.currentUser);
    firebaseUser.bindStream(auth.userChanges());
    ever(firebaseUser, _setInitialScreen);
  }

  void _setInitialScreen(User? user) {
    if (user == null) {
      Get.offAll(() => LoginScreen());
    } else {
      Get.offAll(() => Apitest());
    }
  }

  Future<void> register(String email, String password) async {
    isloading.value = true;
    errorMessage.value = '';
    try {
      await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      Get.snackbar("Success", "Account Created Successfully");
    } on FirebaseAuthException catch (e) {
      errorMessage.value = e.message ?? "Registration Failed";
      Get.snackbar("Error", errorMessage.value);
    } catch (e) {
      errorMessage.value = "An unexpected error occurred";
      Get.snackbar("Error", errorMessage.value);
    } finally {
      isloading.value = false;
    }
  }

  Future<void> login(String email, String password) async {
    isloading.value = true;
    errorMessage.value = '';
    try {
      await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      Get.snackbar("Success", "Login Successful");
    } on FirebaseAuthException catch (e) {
      errorMessage.value = e.message ?? "Login Failed";
      Get.snackbar("Error", errorMessage.value);
    } catch (e) {
      errorMessage.value = "An unexpected error occurred";
      Get.snackbar("Error", errorMessage.value);
    } finally {
      isloading.value = false;
    }
  }

  void logout() async {
    await auth.signOut();
    Get.snackbar("Logged Out", "You have been logged out successfully");
  }
}
