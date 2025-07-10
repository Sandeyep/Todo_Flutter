import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:todo_app/feature/login/login_screen.dart';
import 'package:todo_app/home/dashboard.dart';

class LoginController extends GetxController {
  final FirebaseAuth auth = FirebaseAuth.instance;
  late Rx<User?> firebaseUser;
  //loding and error handling
  RxBool isloading = false.obs;
  RxString errorMessage = ''.obs;

  @override
  void onReady (){
    super.onReady();
    firebaseUser = Rx<User?> (auth.currentUser);
    firebaseUser . bindStream(auth.userChanges());
    ever(firebaseUser, _setInitialScreen);

  }
  void _setInitialScreen(User? user){
    if (user == null){
      Get.offAll(() => LoginScreen());
    }else{
      Get.offAll(() => DashBoard());
    }

  }
  //Register User
  // ignore: non_constant_identifier_names
  Future <void> register(String email, String Password) async {
    isloading.value =true;
    errorMessage.value = '';
    try{
      await auth.createUserWithEmailAndPassword(
        email: email, 
        password: Password,
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

//logout user
void logout() async {
  await auth.signOut();
  Get.snackbar("Logged Out", "You have been Logged out successfully");
}

  Future<void> login(String trim, String trim2) async {}
    }