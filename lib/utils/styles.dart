import 'package:flutter/material.dart';

/// Use class for easy declaration, e.g. Styles.bubbleDiameter
/// Declaring variables outside class can make it difficult to track where variables come from
class Styles {
  static const bubbleDiameter = 272.0;
  static const primaryColor = Color(0xff53a99a);
  static const appFont = 'League Gothic';

  static const bubbleBoxDecoration = BoxDecoration(
    color: primaryColor,
    shape: BoxShape.circle,
    boxShadow: [
      BoxShadow(
        offset: Offset(0, 27),
        blurRadius: 33,
        color: Color(0x3827ae96),
      )
    ],
  );

  static const labelTextStyle = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 19,
    color: Colors.white,
  );

  static const weightTextStyle = TextStyle(
    fontFamily: appFont,
    fontSize: 127,
    color: Colors.white,
  );

  static const unitTextStyle = TextStyle(
    fontFamily: appFont,
    fontSize: 38,
    color: Color(0x80ffffff),
  );
}
