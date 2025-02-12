import 'dart:async';
import 'package:credbevy/view/utils/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';








class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key, required this.route,});
  final String route;

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {


  late Timer _timer;
  int _secondsRemaining = 3;

  @override
  void initState() {
    super.initState();
    startTimer();
    setStatusBarColor();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    resetStatusBarColor();
    _timer.cancel();
    super.dispose();
  }

  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_secondsRemaining > 1) {
          _secondsRemaining--;
          debugPrint("timer: $_secondsRemaining");
        } 
        else {
          // Timer reached 0 seconds, navigate to password expired screen
          timer.cancel(); // Stop the timer
          Get.offNamed(
            widget.route
          );
        }
      });
    });
  }

  void setStatusBarColor() {
    SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      systemNavigationBarColor: AppColor.bgColor,
      statusBarColor: Colors.transparent, 
      statusBarBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.light,
      systemNavigationBarIconBrightness: Brightness.light,
    ),
    );
  }

  void resetStatusBarColor() {
    SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.transparent, //AppColor.white,
      statusBarColor: Colors.transparent, 
      statusBarBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarIconBrightness: Brightness.dark,
    ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.blackColor,
      body: Align(
        alignment: Alignment.center,
        child: 
        /*Image.asset(
          'assets/images/splash_icon.png',
          //height: 40.h,
          //width: 40.w,
          fit: BoxFit.contain,
          filterQuality: FilterQuality.high,
        )*/
        ShaderMask(
          shaderCallback: (bounds) => LinearGradient(
            colors: [AppColor.bgColor, AppColor.bgColor],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ).createShader(bounds),
          child: Text(
            'CredBevy.',
            style: GoogleFonts.inter(
              color: AppColor.bgColor, // This color will be ignored by the shader
              fontSize: 32.sp,
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        
      )
    );
  }
}

