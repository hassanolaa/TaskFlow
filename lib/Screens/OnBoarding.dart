import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:todo_list/Screens/CreateUserScreen.dart';
import 'package:todo_list/theme/AppColors.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  Widget _buildImage(String assetName, [double width = 150]) {
    return Column(
      children: [
        //SizedBox(height: 1,),
        Image.asset('images/$assetName', width: width.w,fit: BoxFit.fitWidth,height: 275.h,),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    const pageDecoration = PageDecoration(
      titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
      bodyPadding: EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 16.0),
      pageColor: Colors.white,
      imagePadding: EdgeInsets.zero,
    );
    return IntroductionScreen(
      onDone: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CreateUserAccScreen(),
            ));
      },
      onSkip: () {
         Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CreateUserAccScreen(),
            ));
      }, // You can override onSkip callback

      globalBackgroundColor: AppColors.Primary,
      showSkipButton: true,
      showNextButton: true,
      back: const Icon(
        Icons.arrow_back,
        color: AppColors.Primary,
      ),
      skip: const Text('Skip',
          style:
              TextStyle(color: AppColors.Primary, fontWeight: FontWeight.w600)),
      next: const Icon(Icons.arrow_forward, color: AppColors.Primary),
      done: const Text('Done',
          style:
              TextStyle(color: AppColors.Primary, fontWeight: FontWeight.w600)),
      curve: Curves.fastLinearToSlowEaseIn,
      controlsMargin: const EdgeInsets.all(16),
      dotsDecorator: const DotsDecorator(
        size: Size(10.0, 10.0),
        color: AppColors.Primary,
        activeSize: Size(22.0, 10.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
      dotsContainerDecorator: const ShapeDecoration(
        color: AppColors.Accent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        ),
      ),
      pages: [
        PageViewModel(
          title: "Welcome to TaskFlow!",
          body:
              "Begin your journey toward enhanced productivity and organization.",
          image: _buildImage('icon.png'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Effortless Task Management",
          body:
              "Seamlessly add, prioritize, and complete tasks with just a few taps.",
          image: _buildImage('test.png'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Prioritize with Ease",
          body:
              "Use our intuitive features to prioritize tasks and stay focused on what matters most.",
          image: _buildImage('3.png'),
          decoration: pageDecoration,
        ),
      ],
    );
  }
}
