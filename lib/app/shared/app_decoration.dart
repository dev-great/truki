import 'package:flutter/material.dart';
import 'package:trucki/core/constant/app_colors.dart';

const tinyTextStyle = TextStyle(
  fontSize: 12,
  fontFamily: 'Raleway',
  color: AppColor.textColor2,
  fontWeight: FontWeight.normal,
);

const bodyTextStyle = TextStyle(
  fontSize: 14,
  fontFamily: 'Raleway',
  color: AppColor.textColor,
  fontWeight: FontWeight.w400,
);

const headerTextStyle = TextStyle(
  fontFamily: 'Raleway',
  fontSize: 23,
  fontWeight: FontWeight.w500,
);

const subHeaderTextStyle = TextStyle(
  fontFamily: 'Raleway',
  fontSize: 16,
  color: AppColor.textColor,
  fontWeight: FontWeight.w700,
);

InputDecoration kInputDecoration = const InputDecoration(
  isDense: true,
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(5),
    ),
    borderSide: BorderSide(
      color: AppColor.primaryColor,
    ),
  ),
  enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(5),
    ),
    borderSide: BorderSide(
      color: AppColor.primaryColor,
      width: 1.5,
    ),
  ),
  errorBorder: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(5)),
    borderSide: BorderSide(
      color: AppColor.errorColor,
      width: 1.5,
    ),
  ),
  focusedErrorBorder: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(5)),
    borderSide: BorderSide(
      color: AppColor.errorColor,
      width: 1.5,
    ),
  ),
);
