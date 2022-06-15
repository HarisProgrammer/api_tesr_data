import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ReusableContainerWidget extends StatelessWidget {
  const ReusableContainerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 24.w,
      height: 11.h,
      decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(10)
      ),
      child:const Icon(Icons.photo_rounded,color: Colors.teal,size: 80,),
    );
  }
}
