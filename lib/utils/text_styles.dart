import 'package:flutter/material.dart';

import 'dimens.dart';

const fontWeightExtraLight = FontWeight.w200;
const fontWeightLight = FontWeight.w300;
const fontWeightRegular = FontWeight.w400;
const fontWeightMedium = FontWeight.w500;
const fontWeightSemiBold = FontWeight.w700;
const fontWeightBold = FontWeight.w700;
const fontWeightExtraBold = FontWeight.w800;

TextStyle textStylePoppinsExtraLight({
  Color color,
  double fontSize,
}) =>
    TextStyle(
        color: color ?? Colors.white,
        fontSize: fontSize ?? fontMedium1,
        fontWeight: fontWeightExtraLight,
        letterSpacing: 0.8);

TextStyle textStylePoppinsLight({
  Color color,
  double fontSize,
}) =>
    TextStyle(
        color: color ?? Colors.white,
        fontSize: fontSize ?? fontMedium1,
        fontWeight: fontWeightLight,
        letterSpacing: 0.8);

TextStyle textStylePoppinsRegular({Color color, double fontSize}) => TextStyle(
    color: color ?? Colors.white,
    fontSize: fontSize ?? fontMedium1,
    fontWeight: fontWeightRegular,
    letterSpacing: 0.8);

TextStyle textStylePoppinsMedium({Color color, double fontSize}) => TextStyle(
    color: color ?? Colors.white,
    fontSize: fontSize ?? fontMedium1,
    fontWeight: fontWeightMedium,
    letterSpacing: 0.8);

TextStyle textStylePoppinsSemiBold({Color color, double fontSize}) => TextStyle(
    color: color ?? Colors.white,
    fontSize: fontSize ?? fontMedium1,
    fontWeight: fontWeightSemiBold,
    letterSpacing: 0.8);

TextStyle textStylePoppinsBold({Color color, double fontSize}) => TextStyle(
    color: color ?? Colors.white,
    fontSize: fontSize ?? fontMedium1,
    fontWeight: fontWeightBold,
    letterSpacing: 0.8);
