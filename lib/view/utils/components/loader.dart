import 'package:credbevy/view/utils/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';






class Loader extends StatelessWidget {
  const Loader({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: LoadingAnimationWidget.threeArchedCircle(  //threeArchedCircle( 
        color: AppColor.lightIndigoColor, 
        size: 35.r,
      ),
    );
  }
}


class LoaderDark extends StatelessWidget {
  const LoaderDark({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: LoadingAnimationWidget.threeArchedCircle( 
        color: AppColor.darkIndigoColor,  
        size: 35.r,
      ),
    );
  }
}