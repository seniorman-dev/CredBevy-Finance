import 'package:credbevy/view/utils/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';








Future<void> showDemureSnackBar({required String title, required String message}) async{
  Get.snackbar(
    title,
    message,
    snackPosition: SnackPosition.TOP,
    //backgroundColor: AppColor.semiIndigoColor,
    snackStyle: SnackStyle.FLOATING,
    barBlur: 10,
    duration: Duration(seconds: 2),
  );
}




Future<void> showMySnackBar({required String message, required Color backgroundColor}) async {
  Get.snackbar(
    "",  // Title (can be empty if not needed)
    message,
    snackPosition: SnackPosition.BOTTOM,
    backgroundColor: backgroundColor,
    colorText: AppColor.bgColor,
    borderRadius: 8.0,
    margin: const EdgeInsets.all(16.0),
    duration: const Duration(seconds: 2), // Adjust the duration as needed
    snackStyle: SnackStyle.FLOATING,
    barBlur: 10,
    animationDuration: const Duration(milliseconds: 300),
    messageText: Text(
      message,
      textAlign: TextAlign.center,
      style: GoogleFonts.poppins(
        color: AppColor.bgColor,
        fontSize: 13.sp,
        fontWeight: FontWeight.normal,
      ),
    ),
  );
}




Future<void> showMessagePopup({ 
  required String title,
  required String message,
  required String buttonText, 
  }) async{
  Get.dialog(
    useSafeArea: true,
    barrierDismissible: false,
    transitionCurve: Curves.easeInCubic,
    AlertDialog.adaptive(
      //barrierDismissible: true,
      elevation: 2,
        backgroundColor: AppColor.bgColor,
        //contentPadding: EdgeInsetsDirectional.symmetric(horizontal: 20.w, vertical: 20.h),
        content: Wrap(
          children: [
            Padding(
              padding: EdgeInsetsDirectional.symmetric(horizontal: 10.w, vertical: 20.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: GoogleFonts.poppins(
                      color: AppColor.darkIndigoColor,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600
                    ),
                  ),
                  SizedBox(height: 20.h,),
                  Text(
                    message,
                    style: GoogleFonts.poppins(
                      color: AppColor.greyColor,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400
                    ),
                    overflow: TextOverflow.clip,
                  ),
              
                  //SizedBox(height: MediaQuery.of(context).size.height * 0.04,),

                  SizedBox(height: 40.h,),
                    
                  InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
                      decoration: BoxDecoration(
                        color: AppColor.darkIndigoColor,
                        borderRadius: BorderRadius.circular(10.r),  //30.r
                      ),
                      //height: 50.h,
                      //width: 110.w,
                      width: double.infinity,
                      child: Text(
                        buttonText,
                        style: GoogleFonts.poppins(
                          color: AppColor.bgColor,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w600
                        )
                      )
                    ),
                  ),   
              
                ],
              ),
            ),
          ],
        ),
      )
  );
  
}


