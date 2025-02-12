import 'package:credbevy/view/utils/theme/app_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';






class CusTextField extends StatefulWidget {
  const CusTextField({super.key,
  //required this.icon, 
  required this.onChanged, 
  required this.hintText, 
  required this.keyboardType, 
  required this.textInputAction, 
  required this.textController, 
  this.onFocusChanged, 
  this.validator, 
  this.onTap, 
  this.initialValue,
  });
  //final Icon icon;
  final TextEditingController textController;
  final TextInputType keyboardType;
  final String hintText;
  final String? initialValue;
  final TextInputAction textInputAction;
  final void Function(String)? onChanged;
  final void Function(bool)? onFocusChanged;
  final String? Function(String?)? validator;
  final void Function()? onTap;

  @override
  State<CusTextField> createState() => _CusTextFieldState();
}

class _CusTextFieldState extends State<CusTextField> {

  @override
  Widget build(BuildContext context) {
    return Focus(
      onFocusChange: widget.onFocusChanged,
      child: TextFormField(
        onTap: widget.onTap,
        onChanged: widget.onChanged,
        controller: widget.textController,
        initialValue: widget.initialValue,
        keyboardType: widget.keyboardType,
        //maxLines: 2,
        minLines: 1,
        inputFormatters: const [],
        enableSuggestions: true,
        enableInteractiveSelection: true,
        cursorColor: AppColor.blackColor,
        style: GoogleFonts.inter(color: AppColor.blackColor, fontSize: 16.sp, fontWeight: FontWeight.w400),    
        textCapitalization: TextCapitalization.sentences,
        textInputAction: widget.textInputAction,          
        scrollPhysics: const BouncingScrollPhysics(),
        validator: widget.validator,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        decoration: InputDecoration(    
          //prefixIcon: widget.icon,
          //SvgPicture.asset(widget.icon, height: 20.h, width: 20.w,), 
          contentPadding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),   
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.r),
            borderSide: BorderSide(color: AppColor.fieldGreyColor), // Set the color you prefer
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.r),
            borderSide: BorderSide(color: AppColor.fieldGreyColor), // Set the color you prefer
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.r),
            borderSide: BorderSide(color: AppColor.blackColor), // Set the color you prefer
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.r),
            borderSide: BorderSide(color: AppColor.redColor), // Set the color you prefer
          ),
          fillColor: AppColor.whiteColor, 
          filled: true,    
          hintText: widget.hintText,
          hintStyle: GoogleFonts.inter(color: AppColor.hintTextGreyColor, fontSize: 16.sp, fontWeight: FontWeight.w400), 
          errorStyle: GoogleFonts.inter(color: AppColor.redColor, fontSize: 13.sp, fontWeight: FontWeight.w400), 
        ),
      ),
    );
  }
}


