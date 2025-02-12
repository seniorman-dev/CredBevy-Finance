import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:credbevy/view/utils/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';






class Header extends StatelessWidget {
  const Header({super.key, required this.userProfilePic, required this.onMenuPresseed});
  final String userProfilePic;
  final VoidCallback onMenuPresseed;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.bgColor,
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
      child: Row(
        //mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: onMenuPresseed,
            child: SvgPicture.asset("assets/svg/menu.svg")
          ),

          CircleAvatar(
            backgroundColor: AppColor.greyColor,
            radius: 31.r, //46.r,
            backgroundImage: CachedNetworkImageProvider(
              userProfilePic,
              errorListener: (err) {
                log("err proessing image: $err");
              },
            ),
          )
        ],
      ),
    );
  }
}