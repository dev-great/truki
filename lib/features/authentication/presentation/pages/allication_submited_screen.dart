import 'package:flutter/material.dart';
import 'package:trucki/app/shared/app_buttons.dart';
import 'package:trucki/app/shared/app_decoration.dart';
import 'package:trucki/core/constant/app_colors.dart';
import 'package:trucki/core/constant/app_images.dart';
import 'package:trucki/core/constant/app_string.dart';
import 'package:trucki/core/constant/ui_helper.dart';
import 'package:trucki/features/dashboard/presentation/dashboard.dart';

class ApplicationSubmitedScreen extends StatefulWidget {
  static const String route = '/application_submited_screen';
  const ApplicationSubmitedScreen({super.key});

  @override
  State<ApplicationSubmitedScreen> createState() =>
      _ApplicationSubmitedScreenState();
}

class _ApplicationSubmitedScreenState extends State<ApplicationSubmitedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primaryColor,
      body: Padding(
        padding: const EdgeInsets.only(
          left: 20,
          right: 20,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 150,
              width: 150,
              child: Image.asset(AppImages.submission),
            ),
            gapSmall,
            Text(
              AppStrings.applicationSubmittedForReview,
              style: headerTextStyle.copyWith(
                color: AppColor.lightColor,
              ),
            ),
            gapTiny,
            Text(
              AppStrings.applicationSubmittedForReviewSubtitle,
              textAlign: TextAlign.center,
              style: bodyTextStyle.copyWith(
                color: AppColor.lightColor,
              ),
            ),
            gapMedium,
            PrimaryBtn(
              title: AppStrings.gotIt,
              onPress: () {
                Navigator.pushNamed(context, DashboardScreen.route);
              },
              color: AppColor.lightColor,
              textColor: AppColor.primaryColor,
            ),
          ],
        ),
      ),
    );
  }
}
