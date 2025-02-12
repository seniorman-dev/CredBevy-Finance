import 'package:credbevy/view/utils/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';









class UnknownPage extends StatelessWidget {
  const UnknownPage({super.key, required this.onPressed,});
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.bgColor,
      body: Center(
        child: Text(
          'Page/Route not found',
          style: GoogleFonts.poppins(
            textStyle: TextStyle(
              color: AppColor.darkIndigoColor,
              fontSize: 20.sp,
              fontWeight: FontWeight.w600
            )
          )
        ),
      ),
    );
  }
}





class NoLaptopView extends StatelessWidget {
  const NoLaptopView({super.key,});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Desktop/Tablet view not available',
          style: GoogleFonts.hind(
            textStyle: TextStyle(
              color: AppColor.blackColor,
              fontSize: 20.sp,
              fontWeight: FontWeight.w600
            )
          )
        ),
      ),
    );
  }
}