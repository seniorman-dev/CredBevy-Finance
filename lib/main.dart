import 'package:credbevy/controller/my_bindings.dart';
import 'package:credbevy/view/routes/route_list.dart';
import 'package:credbevy/view/routes/web_routes.dart';
import 'package:credbevy/view/screens/404page/unknown_route.dart';
import 'package:credbevy/view/utils/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';








void main() {
  WidgetsFlutterBinding.ensureInitialized();

  //keep beneath this widgetflutterbinding widget (it is used to remove the # in flutter web url)
  //usePathUrlStrategy();
  
  //to customize system overlay
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.transparent, //AppColor.white,
      statusBarColor: Colors.transparent, 
      statusBarBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarIconBrightness: Brightness.dark,
    ),
  );
  runApp(const MainApp());
}




class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(414, 896),
      builder: (_, child) {
        return child!;
      },
      child: GetMaterialApp(
        //navigatorKey: navigatorKey,
        debugShowCheckedModeBanner: false,
        title: 'CredBevy',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: AppColor.blackColor),  //AppColor.mainColor
          useMaterial3: true,
        ),
        //defaultTransition: Transition.rightToLeft,
        
        //incase user gets to an unknown route
        unknownRoute: GetPage(
          name: '/', 
          page: () => UnknownPage(
            onPressed: () {}     
          )
        ),
      
        initialBinding: MyBindings(),
        
        //use firebase auth state changes class
        initialRoute: splashPageRouteMain,
        //register all routes for the app here
        getPages: getPages

      
      ),
    );
  }
}
