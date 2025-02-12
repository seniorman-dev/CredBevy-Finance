import 'package:credbevy/view/screens/404page/unknown_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';




class LayoutWidget extends StatelessWidget {
  const LayoutWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (context, constraints) {
          //mobile view
          if(constraints.maxWidth < 600) {
            return const SizedBox(); //MainScreen();
          }
          //web view
          else {
            return const NoLaptopView();
          }
        }
      );
  }
}