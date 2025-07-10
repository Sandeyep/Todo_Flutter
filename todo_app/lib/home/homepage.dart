import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Index'),
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            // handle tap
          },
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: SvgPicture.asset(
              'assets/nav/mk.svg',
              width: 24.w,
              height: 24.h,
              colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              radius: 24.r,
              child: Image.asset(
                'assets/logos/daily.png',
                height: 24.h,
                width: 24.w,
              ),
            ),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/logos/index.png'),
            const SizedBox(height: 20),
            const Text(
              "What do you want to do today?",
              style: TextStyle(
                fontSize: 20.0,
                color: Color.fromARGB(255, 255, 255, 255),
                fontFamily: 'Lato',
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(height: 8),

            const Text(
              "Tap + to add your tasks",
              style: TextStyle(
                fontSize: 16.0,
                color: Color.fromARGB(255, 255, 255, 255),
                fontFamily: 'Lato',
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
