import 'package:flutter/material.dart';
import 'package:trucki/app/shared/app_decoration.dart';
import 'package:trucki/core/constant/app_colors.dart';

class MyPasswordField extends StatelessWidget {
  const MyPasswordField({
    Key? key,
    required this.isPasswordVisible,
    required this.onTap,
    this.color,
    this.textColor,
    this.maxLength,
    this.hintText,
  }) : super(key: key);

  final bool isPasswordVisible;
  final Function onTap;
  final Color? color;
  final Color? textColor;
  final int? maxLength;
  final String? hintText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TextField(
        style: bodyTextStyle.copyWith(
          color: AppColor.textColor,
        ),
        maxLength: maxLength,
        obscureText: isPasswordVisible,
        keyboardType: TextInputType.text,
        textInputAction: TextInputAction.done,
        decoration: InputDecoration(
          suffixIcon: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: IconButton(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onPressed: onTap(),
              icon: Icon(
                isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                color: AppColor.darkColor,
              ),
            ),
          ),
          contentPadding: const EdgeInsets.all(20),
          hintText: hintText ?? 'Password',
          hintStyle: bodyTextStyle,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: color ?? AppColor.textColor,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: color ?? AppColor.textColor,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    );
  }
}
