import 'package:flutter/material.dart';

//--------------- SocialStyle--------------------//
//-----Container Style----
Widget containerStyleSocial({
  required Widget child,
  required Color color,
}) {
  return Container(
      height: 30,
      width: 70,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: color,
      ),
      child: Center(child: child));
}
Widget containerStyleSocial1({
  
  required DecorationImage image,
}) {
  return Container(
      height: 30,
      width: 70,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        image: image,

      ),
      );
}
Widget containerStyleSocial2({
  required Widget child,
  required Color color,
}) {
  return Container(
      height: 30,
      width: 30,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: color,
      ),
      child: Center(child: child));
}
//-------TextStyle Style----
TextStyle textStyleBusinessNewsBold() {
  return const TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.bold,
    color: Color(0xFFFFFFFF),
  );
}

//---------------Detial Style-------------------//
//--------Container Style----
Widget containerStyleBusinessNewsWhite({
  required Widget child,
}) {
  return Container(
      height: 30,
      width: 70,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.white,
      ),
      child: Center(child: child));
}

//-------TextStyle Style----
TextStyle textStyleBusinessNews() {
  return const TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.bold,
    color: Color(0xFF004CFF),
  );
}

//-------TextStyle Style----
TextStyle textStyleBusinessNews2() {
  return const TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.bold,
    color: Color(0xFF004CFF),
  );
}

TextStyle textStyleBusinessNews3() {
  return const TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.normal,
    color: Color(0xFF004CFF),
  );
}
TextStyle textStyleBusinessNews4() {
  return const TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.bold,
    color: Color(0xFFFF0000),
  );
}