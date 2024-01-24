

import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_list/model/Models.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FlutterSplashScreen.fadeIn(
          duration: const Duration(milliseconds: 2515),
          backgroundColor: Colors.white,
          childWidget: SizedBox(
            height: 300.h,
            width: 300.w,
            child: Image.asset("images/icon.png"),
          ),
          onAnimationEnd: () => debugPrint("On Fade In End"),
          nextScreen: Navi(),
        ),
    );
  }
}