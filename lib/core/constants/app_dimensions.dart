import 'package:flutter/cupertino.dart';

class AppDimensions {
  static double defaultPadding(BuildContext context) => paddingMedium(context);
  static double paddingSmall(BuildContext context) => MediaQuery.of(context).size.width * 0.02;
  static double paddingMedium(BuildContext context) => MediaQuery.of(context).size.width * 0.04;
  static double paddingLarge(BuildContext context) => MediaQuery.of(context).size.width * 0.06;
  static double size (BuildContext context) => MediaQuery.of(context).size.width * 0.12;



  static double radiusSmall(BuildContext context) => MediaQuery.of(context).size.width * 0.02;
  static double radiusMedium(BuildContext context) => MediaQuery.of(context).size.width * 0.03;
  static double radiusLarge(BuildContext context) => MediaQuery.of(context).size.width * 0.04;
  static double paddingExtraSmall(BuildContext context) => MediaQuery.of(context).size.width * 0.012;


  static double fontSizeSmall(BuildContext context) => MediaQuery.of(context).size.width * 0.032;
  static double fontSizeMedium(BuildContext context) => MediaQuery.of(context).size.width * 0.042;
  static double fontSizeLarge(BuildContext context) => MediaQuery.of(context).size.width * 0.053;
  static double fontSizeXLarge(BuildContext context) => MediaQuery.of(context).size.width * 0.064;
}

