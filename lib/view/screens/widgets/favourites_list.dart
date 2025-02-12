import 'dart:developer';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:credbevy/controller/app_service.dart';
import 'package:credbevy/model/beneficiaries_model.dart';
import 'package:credbevy/view/utils/theme/app_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';






class FavouritesList extends StatefulWidget {
  const FavouritesList({super.key, required this.favouritesList, required this.service});
  final RxList<UserRecord> favouritesList;
  final AppService service;

  @override
  State<FavouritesList> createState() => _FavouritesListState();
}

class _FavouritesListState extends State<FavouritesList> {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return SizedBox(
          height: 250.h, //290.h, // or whatever height you want for the scrollable area
          child: ListView.separated(
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.symmetric(horizontal: 20.w,  vertical: 20.h),
            scrollDirection: Axis.horizontal,
            separatorBuilder: (context, index) => SizedBox(width: 20.w,),
            itemCount: widget.favouritesList.length,
            itemBuilder: (context, index) {
              final data = widget.favouritesList[index];
        
              return GestureDetector(
                onTap: () {
                  setState(() {
                    //widget.service.selectedIndexFavorite = index;
                    widget.service.onSelectFavorite(index);
                  });
                
                },
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.4, //double.infinity,
                  padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
                  decoration: BoxDecoration(
                    color: widget.service.selectedIndexFavorite == index ? AppColor.blackColor : AppColor.whiteColor,
                    borderRadius: BorderRadius.circular(30.r),
                    boxShadow: [
                      BoxShadow(
                        color: AppColor.blackColor.withOpacity(0.1),
                        blurRadius: 10,
                        spreadRadius: 2,
                        offset: const Offset(0, 5), // Shadow appears under the card
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 5.h,),
                      CircleAvatar(
                        backgroundColor: AppColor.greyColor,
                        radius: 31.r, //46.r,
                        backgroundImage: CachedNetworkImageProvider(
                          "https://images.hdqwalls.com/wallpapers/antoine-griezmann-30.jpg",
                          //data.image,
                          errorListener: (err) {
                            log("err proessing image: $err");
                          },  
                        ),
                      ),
                      SizedBox(height: 20.h,),
                      Text(
                        data.fullname,
                        style: GoogleFonts.inter(
                          color: widget.service.selectedIndexFavorite == index ? Color.fromRGBO(240, 240, 240, 1)  : AppColor.veryBlackColor,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400
                        ),
                      ),
                      SizedBox(height: 20.h,),
                      Icon(
                        color: widget.service.selectedIndexFavorite == index ? AppColor.whiteColor : AppColor.blackColor,
                        size: 30.r,
                        Icons.star
                      ),
                    ],
                  ),
                ),
              );
          
                
              
            },      
          ),
        );
      }
    );
  }
}