import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:trucki/app/shared/app_decoration.dart';
import 'package:trucki/app/styels/ui_helper.dart';
import 'package:trucki/core/constant/app_colors.dart';
import 'package:trucki/core/constant/app_images.dart';
import 'package:trucki/core/constant/app_string.dart';
import 'package:trucki/core/constant/ui_helper.dart';
import 'package:trucki/features/onboarding/presentation/pages/onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  static const String route = '/';

  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _splash();
  }

  _splash() async {
    await Future.delayed(const Duration(milliseconds: 4000), () {
      Navigator.pushNamed(context, IntroductionScreen.route);
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    return Scaffold(
      backgroundColor: AppColor.lightColor,
      body: Container(
        height: screenHeight(context, 0),
        width: screenWidth(context, 0),
        decoration: const BoxDecoration(
            image: DecorationImage(image: AssetImage(AppImages.splashBody))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: screenWidth(context, 2.2),
              height: screenHeight(context, 10),
              child: Image.asset(
                AppImages.logo,
              ),
            ),
            gapTiny,
            Text(
              AppStrings.splashSubtitle,
              style: bodyTextStyle.copyWith(fontStyle: FontStyle.italic),
            ),
            gapSmall,
          ],
        ),
      ),
    );
  }
}
