import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_app/feature/introduction/start_screen.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({super.key});

  @override
  OnBoardingPageState createState() => OnBoardingPageState();
}

class OnBoardingPageState extends State<OnBoardingPage> {
  final introKey = GlobalKey<IntroductionScreenState>();

void _onIntroEnd(context) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('onBoardingDone', true);
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (_) => const StartScreen()),
      (route) => false,
    );
  }
  

  Widget _buildImage(assetName, [double width = 350]) {
    return Image.asset('assets/$assetName', width: width);
  }

  @override
  Widget build(BuildContext context) {
    const bodyStyle = TextStyle(fontSize: 19.0);

    // ignore: unused_local_variable
    const pageDecoration = PageDecoration(
      titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
      bodyTextStyle: bodyStyle,
      bodyPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: Colors.black,
      imagePadding: EdgeInsets.zero,
    );

    return IntroductionScreen(
      key: introKey,
      globalBackgroundColor: Colors.black,
      allowImplicitScrolling: true,
      autoScrollDuration: 8000,
      infiniteAutoScroll: true,
      globalHeader: Align(
        alignment: Alignment.topRight,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 16, right: 16),
            // child: _buildImage('logos/logo.jpg', 100),
          ),
        ),
      ),
      // globalFooter: SizedBox(
      //   width: double.infinity,
      //   height: 60,
      //   child: ElevatedButton(
      //     child: const Text(
      //       'Let\'s go right away!',
      //       style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
      //     ),
      //     onPressed: () => _onIntroEnd(context),
      //   ),
      // ),
      pages: [
        //For First Page -------------------------------------------------
        PageViewModel(
          titleWidget: Text(''),
          image: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _buildImage('logos/logo.jpg'),
                Text(
                  "UpTodo",
                  style: TextStyle(
                    fontSize: 40.0,
                    color: Colors.white,
                    fontFamily: 'Lato',
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
          bodyWidget: Text(''),
          decoration: PageDecoration(pageColor: Colors.black, fullScreen: true),
        ),

        //For Second Page -------------------------------------------------
        PageViewModel(
          titleWidget: Text(''),
          image: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset('assets/logos/manage.jpg'),
                // SizedBox(height: 50),
                Image.asset('assets/logos/NAV.png'),
                // SizedBox(height: 50),
                Text(
                  "Manager your tasks",
                  style: TextStyle(
                    fontSize: 32.0,
                    color: Colors.white,
                    fontFamily: 'Lato',
                    fontWeight: FontWeight.w700,
                  ),
                ),
                // SizedBox(height: 32),
                Text(
                  "You can easily manage all of your daily",
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.white,
                    fontFamily: 'Lato',
                    fontWeight: FontWeight.w400,
                  ),
                ),

                Text(
                  "tasks in DoMe for free",
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.white,
                    fontFamily: 'Lato',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          bodyWidget: Text(''),
          decoration: PageDecoration(pageColor: Colors.black, fullScreen: true),
        ),

        //For Third Page -------------------------------------------------
        PageViewModel(
          titleWidget: Text(''),
          image: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset('assets/logos/daily.png'),
                // SizedBox(height: 50),
                Image.asset('assets/logos/NAV2.png'),
                // SizedBox(height: 50),
                Text(
                  "Create daily routine",
                  style: TextStyle(
                    fontSize: 32.0,
                    color: Colors.white,
                    fontFamily: 'Lato',
                    fontWeight: FontWeight.w700,
                  ),
                ),

                // SizedBox(height: 32),
                Text(
                  "In Uptodo  you can create your",
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.white,
                    fontFamily: 'Lato',
                    fontWeight: FontWeight.w400,
                  ),
                ),

                Text(
                  "personalized routine to stay productive",
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.white,
                    fontFamily: 'Lato',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          bodyWidget: Text(''),
          decoration: PageDecoration(pageColor: Colors.black, fullScreen: true),
        ),

        //For 4th Page -------------------------------------------------
        PageViewModel(
          titleWidget: Text(''),
          image: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset('assets/logos/organize.png'),
                // SizedBox(height: 50),
                Image.asset('assets/logos/NAV3.png'),
                // SizedBox(height: 50),
                Text(
                  "Organize your tasks",
                  style: TextStyle(
                    fontSize: 32.0,
                    color: Colors.white,
                    fontFamily: 'Lato',
                    fontWeight: FontWeight.w700,
                  ),
                ),

                // SizedBox(height: 32),
                Text(
                  "You can organize your daily tasks by",
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.white,
                    fontFamily: 'Lato',
                    fontWeight: FontWeight.w400,
                  ),
                ),

                Text(
                  "adding your tasks into separate categories",
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.white,
                    fontFamily: 'Lato',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          bodyWidget: Text(''),
          decoration: PageDecoration(pageColor: Colors.black, fullScreen: true),
        ),
        //-------------------------------------------------------
      ],
      onDone: () => _onIntroEnd(context),
      onSkip: () => _onIntroEnd(context), // You can override onSkip callback
      showSkipButton: true,
      skipOrBackFlex: 0,
      nextFlex: 0,
      showBackButton: false,
      //rtl: true, // Display as right-to-left
      back: const Icon(Icons.arrow_back),
      skip: const Text('Skip', style: TextStyle(fontWeight: FontWeight.w600)),
      // next: const Icon(Icons.arrow_forward),
      next: const Text(
        'Next',
        style: TextStyle(
           // or any color you like
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),

      done: const Text(
        'Get Started',
        style: TextStyle(fontWeight: FontWeight.w600),
      ),
      curve: Curves.fastLinearToSlowEaseIn,
      controlsMargin: const EdgeInsets.all(16),
      dotsDecorator: const DotsDecorator(
        size: Size(10.0, 10.0),
        color: Color(0xFFBDBDBD),
        activeSize: Size(22.0, 10.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
      dotsContainerDecorator: const ShapeDecoration(
        color: Colors.black87,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        ),
      ),
    );
  }
}
