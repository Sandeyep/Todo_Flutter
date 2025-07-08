import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/feature/login/login_screen.dart';
import 'package:todo_app/feature/register/register_screen.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({super.key});

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Optional: set background color
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 100.h),
            Text(
              'Welcome to the UpTodo',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24.sp,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20.h),
            Text(
              'Start organizing your life today!',
              style: TextStyle(
                color: Colors.white70,
                fontSize: 16.sp,
              ),
              textAlign: TextAlign.center,
            ),
            const Spacer(),

            // LOGIN Button
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (_) => const LoginScreen()),
                  (route) => false,
                );
              },
              child: Container(
                padding: EdgeInsets.all(14.h),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: const Color(0xff88C9FF),
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Center(
                  child: Text(
                    'LOGIN',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 16.h),

            // CREATE ACCOUNT Button
            GestureDetector(
              // onTap: () {
              //   // Replace this with your actual navigation logic
              //   ScaffoldMessenger.of(context).showSnackBar(
              //     const SnackBar(content: Text("Create Account tapped")),
              //   );
              // },

                           onTap: () {
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (_) => const RegisterScreen()),
                  (route) => false,
                );
              },
              child: Container(
                padding: EdgeInsets.all(14.h),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(8.r),
                  border: Border.all(color: const Color(0xff88C9FF)),
                ),
                child: Center(
                  child: Text(
                    'CREATE ACCOUNT',
                    style: TextStyle(
                      color: const Color(0xff88C9FF),
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 50.h),
          ],
        ),
      ),
    );
  }
}
