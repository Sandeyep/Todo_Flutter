import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_app/feature/introduction/introduction.dart';
import 'package:todo_app/feature/login/controller/login_controller.dart';
import 'package:todo_app/feature/login/login_screen.dart';
import 'package:todo_app/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  // ✅ Register controller
  Get.put(LoginController());

  // ✅ Check onboarding status from SharedPreferences
  final prefs = await SharedPreferences.getInstance();
  final isFirstTime = prefs.getBool('onBoardingDone') ?? false;

  runApp(MainApp(showOnBoarding: !isFirstTime));
}

class MainApp extends StatelessWidget {
  final bool showOnBoarding;
  const MainApp({super.key, required this.showOnBoarding});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_,_) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData.dark(useMaterial3: true),
          home: showOnBoarding ? OnBoardingPage() : LoginScreen(),
        );
      },
    );
  }
}