// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:trucki/app/styels/ui_helper.dart';
import 'package:trucki/core/constant/app_colors.dart';

class PrimaryBtn extends StatelessWidget {
  PrimaryBtn({
    Key? key,
    this.color,
    this.textColor,
    this.isIcon,
    this.image,
    this.width,
    this.height,
    this.borderColor,
    this.iconColor,
    this.isImage,
    this.icon,
    required this.title,
    required this.onPress,
  }) : super(key: key);

  Color? color;
  Color? iconColor;
  bool? isIcon;
  bool? isImage;
  double? height;
  double? width;
  Color? borderColor;
  IconData? icon;
  String? image;
  Color? textColor;
  final String title;
  final Function onPress;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onPress();
      },
      child: SizedBox(
        child: Container(
          height: height ?? 56,
          width: width ?? screenWidth(context, 1.1),
          decoration: BoxDecoration(
              color: color ?? AppColor.primaryColor,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: borderColor ?? AppColor.primaryColor)),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                isImage == true
                    ? Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: Container(
                          height: 28,
                          width: 44,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(image!),
                            ),
                          ),
                        ),
                      )
                    : Container(),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'Raleway',
                    color: textColor ?? AppColor.lightColor,
                    decoration: TextDecoration.none,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                isIcon == true
                    ? Padding(
                        padding: const EdgeInsets.only(right: 15),
                        child: Icon(
                          icon,
                          size: 20,
                          color: iconColor,
                        ),
                      )
                    : Container(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
