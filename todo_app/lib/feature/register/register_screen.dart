import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/feature/login/login_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  var passwordController = TextEditingController();
  var emailController = TextEditingController();

  bool isPasswordVisible = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 75.h),
            Text(
              'Register',
              style: TextStyle(color: Colors.white, fontSize: 32.sp),
            ),
            SizedBox(height: 50.h),
            Text(
              'E-mail',
              style: TextStyle(color: Colors.white, fontSize: 14.sp),
            ),
            SizedBox(height: 10.h),
            TextFormField(
              controller: emailController,
              decoration: InputDecoration(
                hintText: "E-mail",
                hintStyle: const TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w500,
                ),

                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  borderSide: const BorderSide(color: Colors.red, width: 1.0),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  borderSide: BorderSide(color: Colors.white, width: 1.0),
                ),
                contentPadding: EdgeInsets.symmetric(horizontal: 10.w),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Password is required';
                }
                return null;
              },
              keyboardType: TextInputType.visiblePassword,
            ),
            SizedBox(height: 25.h),


//Password Field -------------------------------------------------
            Text(
              'Password',
              style: TextStyle(color: Colors.white, fontSize: 14.sp),
            ),
            SizedBox(height: 10.h),

            TextFormField(
              controller: passwordController,
              obscureText: isPasswordVisible,
              decoration: InputDecoration(
                hintText: "Password",
                hintStyle: const TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w500,
                ),
                suffixIcon: IconButton(
                  icon: Icon(
                    isPasswordVisible ? Icons.visibility_off : Icons.visibility,
                    color: Colors.grey,
                    size: 20,
                  ),
                  onPressed: () {
                    setState(() {
                      isPasswordVisible = !isPasswordVisible;
                    });
                  },
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  borderSide: const BorderSide(color: Colors.red, width: 1.0),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  borderSide: BorderSide(color: Colors.white, width: 1.0),
                ),
                contentPadding: EdgeInsets.symmetric(horizontal: 10.w),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Password is required';
                }
                return null;
              },
              keyboardType: TextInputType.visiblePassword,
            ),
            SizedBox(height: 25.h),

//Confirm Password Input-------------------------------------------------
            Text(
              'Confirm Password',
              style: TextStyle(color: Colors.white, fontSize: 14.sp),
            ),
            SizedBox(height: 10.h),
            TextFormField(
              controller: passwordController,
              obscureText: isPasswordVisible,
              decoration: InputDecoration(
                hintText: "Confirm Password",
                hintStyle: const TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w500,
                ),
                suffixIcon: IconButton(
                  icon: Icon(
                    isPasswordVisible ? Icons.visibility_off : Icons.visibility,
                    color: Colors.grey,
                    size: 20,
                  ),
                  onPressed: () {
                    setState(() {
                      isPasswordVisible = !isPasswordVisible;
                    });
                  },
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  borderSide: const BorderSide(color: Colors.red, width: 1.0),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  borderSide: BorderSide(color: Colors.white, width: 1.0),
                ),
                contentPadding: EdgeInsets.symmetric(horizontal: 10.w),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Password is required';
                }
                return null;
              },
              keyboardType: TextInputType.visiblePassword,
            ),


// Register Button -----------------------------------------------------------------
            SizedBox(height: 50.h),
            GestureDetector(
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
                  color: const Color(0xff88C9FF),
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Center(
                  child: Text(
                    'REGISTER',
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
                        
// Already have an account? Link -------------------------------------------------
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Already have an account? ',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const LoginScreen(),
                      ), // Replace with your actual Register screen
                    );
                  },
                  child: Text(
                     ' Login',
                    style: TextStyle(
                      color: Colors
                          .blueAccent, // Use a distinct color to show it's a link
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      // decoration: TextDecoration.underline, // Optional underline
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
