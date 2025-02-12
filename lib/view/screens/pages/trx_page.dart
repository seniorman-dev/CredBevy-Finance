import 'package:credbevy/controller/app_service.dart';
import 'package:credbevy/view/routes/web_routes.dart';
import 'package:credbevy/view/screens/widgets/credit_card_list.dart';
import 'package:credbevy/view/screens/widgets/header.dart';
import 'package:credbevy/view/screens/widgets/trasaction_list.dart';
import 'package:credbevy/view/utils/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';





class TrxPage extends StatelessWidget {
  TrxPage({super.key});

  // GlobalKey for RefreshIndicator
  final GlobalKey<RefreshIndicatorState> _refreshKey = GlobalKey<RefreshIndicatorState>();

  final appService = Get.find<AppService>();

  Future<void> refresh() async{
    await appService.getAllCreditCards()
    .whenComplete(() async{
      await appService.getAllMyExpenses();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: true,
      backgroundColor: AppColor.bgColor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            Header(
              userProfilePic: "https://images.hdqwalls.com/wallpapers/antoine-griezmann-30.jpg", 
              onMenuPresseed: () {}
            ),
            Expanded(
              child: RefreshIndicator.adaptive(
                color: AppColor.greyColor,
                backgroundColor: AppColor.blackColor,
                key: _refreshKey,
                onRefresh: () => refresh(),
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //SizedBox(height: 20.h,),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
                        child: Text(
                          "My Cards",
                          style: GoogleFonts.inter(
                            color: Color.fromRGBO(27, 27, 47, 1),
                            fontSize: 26.sp,
                            fontWeight: FontWeight.w700
                          ),
                        ),
                      ),
                      CreditCardList(
                        cardList: appService.creditCardsArray
                      ),
                
                      //TRANSACTION LIST SECTION
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Transaction History",
                              style: GoogleFonts.inter(
                                color: AppColor.blackColor,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w500
                              ),
                            ),
                
                            InkWell(
                              onTap: () {},
                              child: SvgPicture.asset("assets/svg/filter.svg"),
                            )
                          ],
                        ),
                      ),
                      TrasactionList(
                        trxList: appService.expensesArray,
                        service: appService,
                      ),
                    ],
                  ),
                ),
              )
            )
          ].animate(interval: 200.ms, autoPlay: true).fadeIn(duration: 200.ms, curve: Curves.bounceIn),
        )
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        child: Row(
          //mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //1
            Expanded(
              child: InkWell(
                onTap: () {},
                child: Container(
                  height: 70.h,
                  //padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
                  alignment: Alignment.center,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppColor.whiteColor,
                    borderRadius: BorderRadius.circular(25.r),
                    border: Border.all(
                      color: AppColor.blackColor
                    )
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset("assets/svg/analytics.svg"),
                      SizedBox(width: 10.w,),
                      Text(
                        "Analytics",
                        style: GoogleFonts.inter(
                          color: Color.fromRGBO(68, 68, 73, 1),
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w700,
                        )     
                      ),
                    ],
                  )
                ),
              ),
            ),
            SizedBox(width: 20.w,),
            //2
            Expanded(
              child: InkWell(
                onTap: () {
                  Get.toNamed(
                    sendMoneyPageRoute,
                    arguments: {
                      'service': appService
                    }
                  );
                },
                child: Container(
                  height: 70.h,
                  //padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
                  alignment: Alignment.center,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppColor.blackColor,
                    borderRadius: BorderRadius.circular(25.r),
                    border: Border.all(
                      color: AppColor.blackColor
                    )
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset("assets/svg/send_money.svg"),
                      SizedBox(width: 10.w,),
                      Text(
                        "Send Money",
                        style: GoogleFonts.inter(
                          color: Color.fromRGBO(240, 240, 240, 1), //AppColor.whiteColor,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w700,
                        )     
                      ),
                    ],
                  )
                ),
              ),
            ),
        
          ],
        ),
      ),
    );
  }
}