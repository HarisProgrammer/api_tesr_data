import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CalendarWidget extends StatelessWidget {
  final String myTitle;
  final Color myColor;
  const CalendarWidget({Key? key,required this.myTitle,required this.myColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      width: 24.w,
      height: 5.h,
      decoration:BoxDecoration(
        color:myColor
      ),
      child: Center(child: Text(myTitle,style: TextStyle(color: Colors.white,fontSize:13.sp,fontWeight: FontWeight.bold),)),
    );
  }
}
