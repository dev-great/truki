import 'package:flutter/material.dart';
import 'package:trucki/app/shared/app_buttons.dart';
import 'package:trucki/app/shared/app_decoration.dart';
import 'package:trucki/app/styels/ui_helper.dart';
import 'package:trucki/core/constant/app_colors.dart';
import 'package:trucki/core/constant/app_images.dart';
import 'package:trucki/core/constant/app_keys.dart';
import 'package:trucki/core/constant/app_storage.dart';
import 'package:trucki/core/constant/app_string.dart';
import 'package:trucki/core/constant/ui_helper.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:trucki/features/authentication/presentation/pages/login_screen.dart';
import 'package:trucki/features/authentication/presentation/pages/transporter_details_screen.dart';

class IntroductionScreen extends StatefulWidget {
  static const String route = '/introduction';
  const IntroductionScreen({super.key});

  @override
  State<IntroductionScreen> createState() => _IntroductionScreenState();
}

class _IntroductionScreenState extends State<IntroductionScreen> {
  int currentIndex = 0;

  late PageController _controller;

  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  bool _selectedType = false;
  int darkMode = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.lightColor,
        body: ListView(
          children: [
            Container(
              height: screenHeight(context, 1.7),
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(AppImages.onboarding),
                      fit: BoxFit.cover)),
            ),
            SizedBox(
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 20,
                  right: 20,
                  top: 20,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    gapSmall,
                    const Text(
                      AppStrings.onboardingHeader,
                      textAlign: TextAlign.left,
                      style: headerTextStyle,
                    ),
                    gapSmall,
                    const Text(AppStrings.onboardingSubtitle,
                        textAlign: TextAlign.left, style: bodyTextStyle),
                    gapMedium,
                    gapSmall,
                    PrimaryBtn(
                      title: AppStrings.register,
                      textColor: AppColor.lightColor,
                      onPress: () {
                        _selectUseType(context);
                      },
                    ),
                    gapMedium,
                    PrimaryBtn(
                        title: AppStrings.logIn,
                        color: AppColor.lightColor,
                        textColor: AppColor.primaryColor,
                        borderColor: AppColor.primaryColor,
                        onPress: () {
                          Navigator.pushNamed(context, LoginScreen.route);
                        }),
                    gapMedium,
                  ],
                ),
              ),
            ),
          ],
        ));
  }

  void _selectUseType(BuildContext context) {
    showModalBottomSheet(
      context: context,
      enableDrag: false,
      isDismissible: false,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      builder: (BuildContext context) {
        return StatefulBuilder(builder: (context, setState) {
          return Padding(
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
                top: 20,
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Icon(Iconsax.close_circle_copy),
                      )
                    ],
                  ),
                  gapMedium,
                  Row(
                    children: [
                      Text(
                        AppStrings.accountTypeHeader,
                        style: headerTextStyle.copyWith(
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  gapMedium,
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        Prefs.saveKey(AppKeys.accountType, "1").then((value) =>
                            Navigator.pushNamed(
                                context, TransporterDetailsScreen.route));
                      });
                      Navigator.pushNamed(
                          context, TransporterDetailsScreen.route);
                    },
                    child: Container(
                      height: 90,
                      decoration: BoxDecoration(
                          color: AppColor.primaryLiteColor.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                        padding: const EdgeInsets.only(right: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Radio(
                              value: _selectedType,
                              groupValue: AppStrings.transporter,
                              onChanged: (value) {
                                setState(() {
                                  !_selectedType;
                                });
                              },
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 12),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    AppStrings.transporter,
                                    style: subHeaderTextStyle,
                                  ),
                                  gapTiny,
                                  SizedBox(
                                    width: screenWidth(context, 1.5),
                                    child: Text(
                                      AppStrings.transporterSubtitle,
                                      style: bodyTextStyle.copyWith(
                                          color: AppColor.textColor2),
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  gapMedium,
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      height: 90,
                      decoration: BoxDecoration(
                          color: AppColor.primaryLiteColor.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                        padding: const EdgeInsets.only(right: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Radio(
                              value: "",
                              groupValue: AppStrings.transporter,
                              onChanged: (value) {},
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 12),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    AppStrings.driver,
                                    style: subHeaderTextStyle,
                                  ),
                                  gapTiny,
                                  SizedBox(
                                    width: screenWidth(context, 1.5),
                                    child: Text(
                                      AppStrings.driverSubtitle,
                                      style: bodyTextStyle.copyWith(
                                          color: AppColor.textColor2),
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  gapMedium,
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        Prefs.saveKey(AppKeys.accountType, "3").then((value) =>
                            Navigator.pushNamed(
                                context, TransporterDetailsScreen.route));
                      });
                    },
                    child: Container(
                      height: 90,
                      decoration: BoxDecoration(
                          color: AppColor.primaryLiteColor.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                        padding: const EdgeInsets.only(right: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Radio(
                              value: "",
                              groupValue: AppStrings.transporter,
                              onChanged: (value) {},
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 12),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    AppStrings.fleetOwner,
                                    style: subHeaderTextStyle,
                                  ),
                                  gapTiny,
                                  SizedBox(
                                    width: screenWidth(context, 1.5),
                                    child: Text(
                                      AppStrings.fleetOwnerSuntitle,
                                      style: bodyTextStyle.copyWith(
                                          color: AppColor.textColor2),
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ));
        });
      },
    );
  }
}
