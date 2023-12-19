import 'package:flutter/material.dart';

Widget shadowColor({
  required double coor1,
  required double coor2,
  required double height,
  required double width,
  required BoxDecoration boxDecoration,
}) {
  return Align(
      alignment: AlignmentDirectional(coor1, coor2),
      child:
          Container(height: height, width: width, decoration: boxDecoration));
}
