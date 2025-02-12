import 'package:credbevy/view/utils/components/loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';








class PikaButton extends StatefulWidget {
  PikaButton({
    super.key, 
    this.isTextNum = false,
    required this.onPressed, 
    required this.backgroundColor, 
    required this.text, 
    required this.textColor,
    RxBool? isLoading, // Nullable parameter
  }): isLoading = isLoading ?? RxBool(false); // Default value assigned here

  final bool isTextNum;
  final RxBool isLoading;
  final VoidCallback onPressed;
  final Color backgroundColor; // List of colors for the gradient
  final Color textColor;
  final String text;

  @override
  State<PikaButton> createState() => _PikaButtonState();
}

class _PikaButtonState extends State<PikaButton> with SingleTickerProviderStateMixin {


  late final AnimationController _controller;
  
  //handles the animation upon press
  Future<void> handlePress() async {
    if (widget.onPressed == null) {
      _controller.forward().then((_) => _controller.reverse());
    }
    else {
      _controller.forward().then((_) => _controller.reverse());
      widget.onPressed();
    }
    return;
  }


  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Transform.scale(
          scale: (1.0 + (0.1 * _controller.value)).clamp(1.0, 1.05),
          child: GestureDetector(
            onTap: () => handlePress(), ///widget.onPressed,
            child: Container(
              //height: 70.h,
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
              alignment: Alignment.center,
              width: double.infinity,
              decoration: BoxDecoration(
                /*gradient: LinearGradient(
                  colors: gradientColors, // Gradient colors
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),*/
                color: widget.backgroundColor,
                borderRadius: BorderRadius.circular(20.r),
              ),
              child: Obx(
                () {
                  return widget.isLoading.value ? Loader() : Text(
                    widget.text,
                    style: widget.isTextNum 
                      ? GoogleFonts.inter(
                        //height: 18.4.sp,
                        color: widget.textColor,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w700,
                      ) 
                      : GoogleFonts.inter(
                        //height: 18.4.sp,
                        color: widget.textColor,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    textAlign: TextAlign.center,
                  );
                }
              ),
            ),
          ),
        );
      }
    );
  }
}



//CUSTOM ICON BUTTON
class PikaIconButton extends StatefulWidget {
  PikaIconButton({
    super.key, 
    this.isTextNum = false,
    //this.loadingIcon,
    required this.icon,
    required this.onPressed, 
    required this.backgroundColor, 
    required this.text, 
    required this.textColor,
    RxBool? isLoading, // Nullable parameter
  }): isLoading = isLoading ?? RxBool(false); // Default value assigned here
  final bool isTextNum;
  final RxBool isLoading;
  final Widget icon;
  //final Widget? loadingIcon;
  final VoidCallback onPressed;
  final Color backgroundColor; // List of colors for the gradient
  final Color textColor;
  final String text;

  @override
  State<PikaIconButton> createState() => _PikaIconButtonState();
}

class _PikaIconButtonState extends State<PikaIconButton> with SingleTickerProviderStateMixin {

  late final AnimationController _controller;
  
  //handles the animation upon press
  Future<void> handlePress() async {
    if (widget.onPressed == null) {
      _controller.forward().then((_) => _controller.reverse());
    }
    else {
      _controller.forward().then((_) => _controller.reverse());
      widget.onPressed();
    }
    return;
  }


  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Transform.scale(
          scale: (1.0 + (0.1 * _controller.value)).clamp(1.0, 1.05),
          child: InkWell(
            onTap: () => handlePress(),
            child: Container(
              //height: 70.h,
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
              alignment: Alignment.center,
              width: double.infinity,
              decoration: BoxDecoration(
                /*gradient: LinearGradient(
                  colors: gradientColors, // Gradient colors
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),*/
                color: widget.backgroundColor,
                borderRadius: BorderRadius.circular(20.r),
              ),
              child: Obx(
                () {
                  return widget.isLoading.value ? Loader() :  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        widget.text,
                        style: widget.isTextNum 
                        ? GoogleFonts.inter(
                          //height: 18.4.sp,
                          color: widget.textColor,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w700,
                        ) 
                        : GoogleFonts.inter(
                          //height: 18.4.sp,
                          color: widget.textColor,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w700,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(width: 10.w,),
                      widget.icon
                      /*Icon(
                        color: textColor,
                        size: 24.r,
                        icon,
                      ),*/
                    ],
                  );
                }
              ),
            ),
          ),
        );
      }
    );
  }
}




//CUSTOM ICON BUTTON
class PikaIconButton2 extends StatefulWidget {
  PikaIconButton2({
    super.key, 
    this.isTextNum = false,

    //this.loadingIcon,
    required this.icon,
    required this.onPressed, 
    required this.backgroundColor, 
    required this.text, 
    required this.textColor,
  
    RxBool? isLoading, // Nullable parameter
  }): isLoading = isLoading ?? RxBool(false); // Default value assigned here
  final bool isTextNum;
  final RxBool isLoading;
  //final Widget? loadingIcon;
  final Widget icon;
  final VoidCallback onPressed;
  final Color backgroundColor; // List of colors for the gradient
  final Color textColor;
  final String text;

  @override
  State<PikaIconButton2> createState() => _PikaIconButton2State();
}

class _PikaIconButton2State extends State<PikaIconButton2> with SingleTickerProviderStateMixin {

  late final AnimationController _controller;
  
  //handles the animation upon press
  Future<void> handlePress() async {
    if (widget.onPressed == null) {
      _controller.forward().then((_) => _controller.reverse());
    }
    else {
      _controller.forward().then((_) => _controller.reverse());
      widget.onPressed();
    }
    return;
  }


  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Transform.scale(
          scale: (1.0 + (0.1 * _controller.value)).clamp(1.0, 1.05),
          child: InkWell(
            onTap: () => handlePress(),
            child: Container(
              //height: 70.h,
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
              alignment: Alignment.center,
              width: double.infinity,
              decoration: BoxDecoration(
                /*gradient: LinearGradient(
                  colors: gradientColors, // Gradient colors
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),*/
                color: widget.backgroundColor,
                borderRadius: BorderRadius.circular(20.r),
              ),
              child: Obx(
                () {
                  return widget.isLoading!.value ?  Loader() : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      widget.icon,
                      SizedBox(width: 10.w,),
                      Text(
                        widget.text,
                        style: widget.isTextNum 
                        ? GoogleFonts.inter(
                          //height: 18.4.sp,
                          color: widget.textColor,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w700,
                        ) 
                        : GoogleFonts.inter(
                          //height: 18.4.sp,
                          color: widget.textColor,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w700,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      
                    ],
                  );
                }
              ),
            ),
          ),
        );
      }
    );
  }
}
