import 'dart:developer';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:credbevy/controller/app_service.dart';
import 'package:credbevy/model/expenses_model.dart';
import 'package:credbevy/view/utils/components/converters.dart';
import 'package:credbevy/view/utils/components/loader.dart';
import 'package:credbevy/view/utils/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';







class TrasactionList extends StatelessWidget {
  const TrasactionList({super.key, required this.trxList, required this.service});
  final RxList<ExpenseRecord> trxList;
  final AppService service;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        if(service.isLoading.value){
          return LoaderDark();
        }
        if(trxList.isEmpty) {
          return Text(
            "No expenses found!",
            style: GoogleFonts.inter(
              color: Color.fromRGBO(69, 69, 69, 1),
              fontSize: 16.sp,
              fontWeight: FontWeight.w500
            ),
            textAlign: TextAlign.center,
            overflow: TextOverflow.clip,
          );
        }
        return ListView.separated(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          scrollDirection: Axis.vertical,
          separatorBuilder: (context, index) => SizedBox(height: 20.h,),
          itemCount: trxList.length,
          itemBuilder: (context, index) {
            final data = trxList[index];
            return Container(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColor.whiteColor,
                borderRadius: BorderRadius.circular(30.r),
                boxShadow: [
                  BoxShadow(
                    color: AppColor.blackColor.withOpacity(0.1),
                    blurRadius: 10,
                    spreadRadius: 2,
                    offset: const Offset(0, 5), // Shadow appears under the card
                  )
                ],
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CircleAvatar(
                    backgroundColor: AppColor.greyColor,
                    radius: 35.r, //31.r,
                    backgroundImage: CachedNetworkImageProvider(
                      "https://logolook.net/wp-content/uploads/2021/06/Symbol-Spotify.png",
                      errorListener: (err) {
                        log("err proessing image: $err");
                      },
                    ),
                  ),
                  SizedBox(width: 15.w,),
                  Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        //1
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Spotify Subscription",
                                style: GoogleFonts.inter(
                                  color: Color.fromRGBO(69, 69, 69, 1),
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w500
                                ),
                                overflow: TextOverflow.clip,
                              ),
                              SizedBox(height: 8.h,),
                              Text(
                                "${data.month} - 10:00 PM",
                                style: GoogleFonts.inter(
                                  color: Color.fromRGBO(69, 69, 69, 1),
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w400
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                          
                            ],
                          ),
                        ),
                        SizedBox(width: 10.w,),
                        //2
                        Text(
                          "-${currency(context).currencySymbol}${data.amountSpent}",
                          style: GoogleFonts.inter(
                            color: AppColor.veryBlackColor,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w700
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            );
          }
        );
      }
    );
  }
}