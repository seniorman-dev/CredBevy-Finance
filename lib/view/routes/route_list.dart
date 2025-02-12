import 'package:credbevy/view/routes/web_routes.dart';
import 'package:credbevy/view/screens/pages/send_money_page.dart';
import 'package:credbevy/view/screens/pages/trx_page.dart';
import 'package:credbevy/view/screens/pages/trx_successful_page.dart';
import 'package:credbevy/view/screens/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';




List<GetPage<dynamic>>? getPages = [
  
  //SplashScreen
  /*GetPage(
    name: splashPageRoute,
    page: () => const SplashScreen(
      route: layoutPageRoute,
    ), //MainScreenPageRoute
    curve: Curves.bounceInOut,
    transition: Transition.rightToLeft,
  ), 

  //Layout
  GetPage(
    name: layoutPageRoute,
    page: () => const LayoutWidget(),
    curve: Curves.bounceInOut,
    transition: Transition.rightToLeft,
  ),*/


  //splash mainscreen
  GetPage(
    name: splashPageRouteMain,
    page: () => const SplashScreen(
      route: trxPageRoute,
    ), 
    curve: Curves.bounceInOut,
    transition: Transition.upToDown,
  ),

  //splash onboarding
  GetPage(
    name: splashPageRouteOnb,
    page: () => const SplashScreen(
      route: '', //onboardingPageRoute,
    ), 
    curve: Curves.bounceInOut,
    transition: Transition.upToDown,
  ),

  //Main Page (TRX Page)
  GetPage(
    name: trxPageRoute,
    page: () => TrxPage(),
    curve: Curves.bounceInOut,
    transition: Transition.upToDown,
  ),

  //Send Fund Page
  GetPage(
    name: sendMoneyPageRoute,
    page: () {
      final args = Get.arguments;
      return SendMoneyPage(
        appService: args["service"],
      );
    },
    curve: Curves.bounceInOut,
    transition: Transition.upToDown,
  ),

  //Trx-Successful-Page
  GetPage(
    name: trxSuccessPageRoute,
    page: () {
      final args = Get.arguments;
      return TrxSuccessfulPage(
        name: args["name"],
        amount: args["amount"],
      );
    },
    curve: Curves.bounceInOut,
    transition: Transition.upToDown,
  ),

];


