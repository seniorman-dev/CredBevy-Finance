import 'package:credbevy/controller/api_service.dart';
import 'package:credbevy/controller/app_service.dart';
import 'package:get/get.dart';







class MyBindings implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    //Get.put(() => ConnectionService(), permanent: true);
    Get.lazyPut(() => ApiService(), fenix: true);
    Get.lazyPut( () => AppService(), fenix: true);  

  }
  
}