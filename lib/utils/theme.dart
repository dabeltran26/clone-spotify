import 'package:flutter/material.dart';

class MyTheme {
  static final generalColors = _GeneralColors();
  static final generalFonts = _GeneralTextStyles();
}

class _GeneralColors{
  final Color black = const Color(0xFF000000);
  final Color white = const Color(0xFFFFFFFF);
  final Color green =  const Color(0xFF017E14);
  final Color grey =  const Color(0xFF808080);
}

class _GeneralTextStyles{

  final regular =  TextStyle(
      color: MyTheme.generalColors.black,
      fontSize: 10,
      fontStyle: FontStyle.normal,
      fontFamily: 'Open Sans'
  );

  final medium =  TextStyle(
      color: MyTheme.generalColors.black,
      fontSize: 12,
      fontStyle: FontStyle.normal,
      fontFamily: 'Open Sans'
  );

  final large =  TextStyle(
      color: MyTheme.generalColors.black,
      fontSize: 14,
      fontStyle: FontStyle.normal,
      fontFamily: 'Open Sans'
  );

  final bold =  TextStyle(
      color: MyTheme.generalColors.black,
      fontSize: 16,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.bold,
      fontFamily: 'Open Sans'
  );

}