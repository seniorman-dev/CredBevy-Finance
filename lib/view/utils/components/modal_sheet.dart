import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';











Future<void> showMyModalSheet({
  //required BuildContext context,
  required Color backgroundColor,
  required Widget content
}) async{
  
  Get.bottomSheet(
    content,
    backgroundColor: backgroundColor,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(topLeft: Radius.circular(15.r), topRight: Radius.circular(15.r))  //vertical(top: Radius.circular(20)),
    ),
    isScrollControlled: true,
  );
}