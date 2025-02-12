import 'package:credbevy/model/credit_card_model.dart';
import 'package:credbevy/view/utils/theme/app_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';





class CreditCardList extends StatelessWidget {
  const CreditCardList({super.key, required this.cardList});
  final RxList<CardData> cardList;


  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        if(cardList.isEmpty) {
          return Center(
            child: Text(
              "No cards found. \nPull to refresh!",
              style: GoogleFonts.inter(
                color: Color.fromRGBO(69, 69, 69, 1),
                fontSize: 16.sp,
                fontWeight: FontWeight.w500
              ),
              textAlign: TextAlign.center,
              overflow: TextOverflow.clip,
            ),
          );
        }
        return SizedBox(
          height: 270.h, //290.h, // or whatever height you want for the scrollable area
          child: ListView.separated(
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
            scrollDirection: Axis.horizontal,
            separatorBuilder: (context, index) => SizedBox(width: 20.w,),
            itemCount: cardList.length,
            itemBuilder: (context, index) {
              final data = cardList[index];
        
              return Container(
                width: MediaQuery.of(context).size.width * 0.8, //double.infinity,
                padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
                decoration: BoxDecoration(
                  color: index.isEven ? const Color.fromRGBO(251, 174, 238, 0.37) : const Color.fromARGB(255, 91, 187, 175),
                  gradient: index.isEven ? const LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [
                      Color.fromRGBO(255, 195, 224, 1),
                      Color.fromRGBO(255, 120, 237, 1),
                    ]
                  )
                  : null,
                  borderRadius: BorderRadius.circular(30.r),
                  boxShadow: [
                    /*const BoxShadow(
                      color: Colors.transparent,
                      offset: const Offset(0, 20),
                      blurRadius: 40,
                      spreadRadius: 0
                    ),*/
                    BoxShadow(
                      color: AppColor.blackColor.withOpacity(0.1),
                      blurRadius: 10,
                      spreadRadius: 0,
                      offset: const Offset(0, 5), // Shadow appears under the card
                    )
                  ]
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //1
                    Row(
                      //mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          data.bankName,
                          style: GoogleFonts.inter(
                            color: AppColor.whiteColor,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400
                          ),
                        ),
              
                        Icon(
                          color: AppColor.whiteColor,
                          size: 44.r,
                          Icons.wallet
                        )
                      ],
                    ),
                    SizedBox(height: 30.h,),
                    //2
                    Text(
                      data.cardNumber,
                      style: GoogleFonts.inter(
                        color: AppColor.whiteColor,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w400
                      ),
                    ),
                    SizedBox(height: 30.h,),
                    //3
                    Row(
                      //mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "NAME",
                              style: GoogleFonts.inter(
                                color: AppColor.whiteColor,
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w400
                              ),
                            ),
                            SizedBox(height: 2.h,),
                            Text(
                              data.name,
                              style: GoogleFonts.inter(
                                color: AppColor.whiteColor,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "EXPIRY",
                              style: GoogleFonts.inter(
                                color: AppColor.whiteColor,
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w400
                              ),
                            ),
                            SizedBox(height: 2.h,),
                            Text(
                              data.expiryDate,
                              style: GoogleFonts.inter(
                                color: AppColor.whiteColor,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },      
          ),
        );
      }
    );
  }
}