import 'package:flutter/material.dart';

class MySizeBox extends StatelessWidget {
  final double? myHeight;
  final double? myWidth;
  const MySizeBox({Key? key,this.myHeight,this.myWidth}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: myWidth,
      height: myHeight,
    );
  }
}
