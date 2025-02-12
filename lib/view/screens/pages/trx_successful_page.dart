import 'package:credbevy/view/routes/web_routes.dart';
import 'package:credbevy/view/utils/buttons/pika_button.dart';
import 'package:credbevy/view/utils/components/converters.dart';
import 'package:credbevy/view/utils/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';





class TrxSuccessfulPage extends StatelessWidget {
  const TrxSuccessfulPage({super.key, required this.name, required this.amount});
  final String name;
  final String amount;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: true,
      backgroundColor: AppColor.bgColor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            SizedBox(height: MediaQuery.of(context).size.height * 0.2,),
            SvgPicture.asset(
              "assets/svg/check_mark.svg",
              height: 108.h,
              width: 108.w,
            ),
            SizedBox(height: 30.h,),
            Text(
              "${currency(context).currencySymbol}$amount",
              style: GoogleFonts.inter(
                color: Color.fromRGBO(33, 43, 54, 1),
                fontSize: 30.sp,
                fontWeight: FontWeight.w700,
              )     
            ),
            SizedBox(height: 20.h,),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "Transfer successfully sent to ",
                    style: GoogleFonts.inter(
                      color: Color.fromRGBO(33, 43, 54, 1),
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400
                    )
                  ),
                  TextSpan(
                    text: "$name. \n",
                    style: GoogleFonts.inter(
                      color: Color.fromRGBO(33, 43, 54, 1),
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w700
                    )
                  ),
                  TextSpan(
                    text: "Ref: The latest batch 99.9% pure.",
                    style: GoogleFonts.inter(
                      color: Color.fromRGBO(33, 43, 54, 1),
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400
                    )
                  ),
                ]
              )
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.25,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: PikaButton(
                onPressed: () {
                  Get.offAllNamed(
                    trxPageRoute
                  );
                }, 
                backgroundColor: AppColor.blackColor, 
                text: "Back", 
                textColor: AppColor.whiteColor
              ),
            )
          ]
        )
      )
    );
  }
}