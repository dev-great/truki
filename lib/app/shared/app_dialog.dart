import 'package:flutter/material.dart';
import 'package:trucki/app/shared/app_decoration.dart';
import 'package:trucki/core/constant/app_colors.dart';
import 'package:trucki/core/constant/app_images.dart';

class AppDialog extends StatelessWidget {
  const AppDialog({
    super.key,
    required this.subtitle,
    required this.title,
  });
  final String subtitle;
  final String title;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppColor.whiteColor,
      surfaceTintColor: AppColor.whiteColor,
      actionsPadding: EdgeInsets.zero,
      contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
      icon: SizedBox(
        height: 60,
        width: 60,
        child: Image.asset(AppImages.success),
      ),
      title: Text(
        title,
        style: headerTextStyle,
        textAlign: TextAlign.center,
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Text(
              subtitle,
              textAlign: TextAlign.center,
              style: bodyTextStyle,
            ),
          ),
        ],
      ),
    );
  }
}
