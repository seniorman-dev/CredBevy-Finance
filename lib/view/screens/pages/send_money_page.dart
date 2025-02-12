import 'package:credbevy/controller/app_service.dart';
import 'package:credbevy/view/routes/web_routes.dart';
import 'package:credbevy/view/screens/widgets/favourites_list.dart';
import 'package:credbevy/view/screens/widgets/header.dart';
import 'package:credbevy/view/utils/buttons/pika_button.dart';
import 'package:credbevy/view/utils/components/converters.dart';
import 'package:credbevy/view/utils/components/custom_textfield.dart';
import 'package:credbevy/view/utils/components/my_snackbar.dart';
import 'package:credbevy/view/utils/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';






class SendMoneyPage extends StatelessWidget {
  const SendMoneyPage({super.key, required this.appService});
  final AppService appService;


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
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                physics: BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Current Balance",
                            style: GoogleFonts.inter(
                              color: AppColor.veryBlackColor,
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w400
                            ),
                          ),
                          SizedBox(height: 2.h,),
                          Obx(
                            () {
                              return Text(
                                "${currency(context).currencySymbol}${appService.accBalance.value}",
                                style: GoogleFonts.inter(
                                  color: AppColor.veryBlackColor,
                                  fontSize: 26.sp,
                                  fontWeight: FontWeight.w700
                                ),
                              );
                            }
                          ),
                        ],
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              InkWell(
                                onTap: () {},
                                child: Container(
                                  //height: 70.h,
                                  padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                                  alignment: Alignment.center,
                                  //width: 100.w, //double.infinity,
                                  decoration: BoxDecoration(
                                    color: AppColor.whiteColor,
                                    borderRadius: BorderRadius.circular(25.r),
                                    border: Border.all(
                                      color: AppColor.blackColor.withOpacity(0.4)
                                    )
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SvgPicture.asset("assets/svg/star_black.svg"),
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
                              SizedBox(width: 10.w,),
                              InkWell(
                                onTap: () {},
                                child: Container(
                                  //height: 70.h,
                                  padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                                  alignment: Alignment.center,
                                  //width: 100.w, //double.infinity,
                                  decoration: BoxDecoration(
                                    color: AppColor.whiteColor,
                                    borderRadius: BorderRadius.circular(25.r),
                                    border: Border.all(
                                      color: AppColor.blackColor.withOpacity(0.1)
                                    )
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SvgPicture.asset("assets/svg/player.svg"),
                                      SizedBox(width: 10.w,),
                                      Text(
                                        "All Friends",
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
                            ],
                          ),

                          InkWell(
                            onTap: () {},
                            child: SvgPicture.asset("assets/svg/add_circle.svg"),
                          )
                        ],
                      ),
                    ),

                    SizedBox(height: 10.h,),
                    FavouritesList(
                      favouritesList: appService.beneficiariesArray,
                      service: appService,
                    ),

                    //TEXTFIELDS
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Name",
                            style: GoogleFonts.inter(
                              color: Color.fromRGBO(33, 43, 54, 1),
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                            )     
                          ),
                          SizedBox(height: 10.h,),
                          CusTextField(
                            onChanged: (val) {},
                            hintText: "Receiver's name", 
                            keyboardType: TextInputType.name, 
                            textInputAction: TextInputAction.next, 
                            textController: appService.nameTextController
                          ),

                          SizedBox(height: 30.h,),
                          Text(
                            "Amount ${currency(context).currencySymbol}",
                            style: GoogleFonts.inter(
                              color: Color.fromRGBO(33, 43, 54, 1),
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                            )     
                          ),
                          SizedBox(height: 10.h,),
                          CusTextField(
                            onChanged: (val) {},
                            hintText: "Enter amount in USD", 
                            keyboardType: TextInputType.numberWithOptions(), 
                            textInputAction: TextInputAction.next, 
                            textController: appService.amountTextController
                          ),
                          //SizedBox(height: 5.h,),
                          //SELECTOR

                          SizedBox(height: 30.h,),
                          Text(
                            "Reference",
                            style: GoogleFonts.inter(
                              color: Color.fromRGBO(33, 43, 54, 1),
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                            )     
                          ),
                          SizedBox(height: 10.h,),
                          CusTextField(
                            onChanged: (val) {},
                            hintText: "What is this transfer for?", 
                            keyboardType: TextInputType.text, 
                            textInputAction: TextInputAction.done, 
                            textController: appService.referenceTextController
                          ),


                        ],
                      ),
                    ),

                  ].animate(interval: 200.ms, autoPlay: true).fadeIn(duration: 200.ms, curve: Curves.bounceIn),
                )
              )
            ),
        
            //Send button here
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
              child: PikaIconButton2(
                onPressed: () async{
                  if(appService.nameTextController.text.isNotEmpty && appService.amountTextController.text.isNotEmpty && appService.referenceTextController.text.isNotEmpty) {
                    await appService.transferMoney(
                      receiverId: appService.selectedBefId.value, 
                      amount: int.parse(appService.amountTextController.text), 
                      onSuccess: () {
                        showMySnackBar(
                          message: "transfer successful", 
                          backgroundColor: AppColor.greenColor
                        );
                        //navigate to the success page
                        Get.toNamed(
                          trxSuccessPageRoute,
                          arguments: {
                            "name": appService.nameTextController.text,
                            "amount": appService.amountTextController.text,
                          }
                        );
                        appService.nameTextController.clear();
                        appService.amountTextController.clear();
                        appService.referenceTextController.clear();
                      }
                    );
                    //await appService.getMyBalance();
                  }
                  else {
                    showMySnackBar(
                      message: "fields must not be empty", 
                      backgroundColor: AppColor.redColor
                    );
                  }
                },
                backgroundColor: AppColor.blackColor, 
                text: "Send Money", 
                textColor: Color.fromRGBO(240, 240, 240, 1),
                icon: SvgPicture.asset("assets/svg/send_money.svg"),
                isLoading: appService.isLoading,
              ),
            )
          ]
        )
      )
    );
  }
}