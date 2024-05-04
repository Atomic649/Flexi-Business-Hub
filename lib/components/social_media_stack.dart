import 'package:flutter/material.dart';

// ปรับขนาด Social Media box ที่นี่
Widget socialMediaContainer({
  required Widget child,
  required Color color,
  required double height,
  required double width,
}) {
  return GestureDetector(
    child: AnimatedContainer(
        duration: Duration(seconds: 1),
        height: height,
        width: width,
        child: Card(
          clipBehavior: Clip.antiAlias,
          margin: EdgeInsets.all(3.0),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          elevation: 4.0,
          shadowColor: Color(0xFF2B00FF),
          color: color,
          child: child,
        )),
  );
}

//  ซ้อน Logo กับ Box
Widget socialMediaStack({
  required List<Widget> children,
}) {
  return Stack(
    clipBehavior: Clip.none,
    alignment: Alignment.topRight,
    children: children,
  );
}

// ตำหน่ง Logo กับ Box
Widget socialBoxPosition({
  required Widget child,
  required Function()? ontap,
  required Function()? onDoubleTap,
}) {
  return Positioned(
    top: -9.0,
    right: 155.0,
    child: InkWell(
      onTap: ontap,
      onDoubleTap: onDoubleTap,
      child: child,
    ),
  );
}
//---------------------------------------------------------
TextStyle profitTextStyle() {
  return 
    const TextStyle(
      fontSize: 23,
      fontWeight: FontWeight.bold,
      shadows: <Shadow>[
        Shadow(
          offset: Offset(1.0, 1.0),
          blurRadius: 0.0,
          color: Color(0xFF003376),
        ),
        Shadow(
          offset: Offset(1.0, 1.0),
          blurRadius: 0.0,
          color: Color(0xFF003376),
        ),
      ],

      color: Colors.lightGreenAccent);    
}

Widget profitPosition({
  required Widget child,
}) {
  return Positioned(
    top: 75.0,
    right: -3.0,   
   
      child: child,
    );
  }
