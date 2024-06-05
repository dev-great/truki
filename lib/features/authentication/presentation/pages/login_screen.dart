import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:trucki/app/shared/app_buttons.dart';
import 'package:trucki/app/shared/app_decoration.dart';
import 'package:trucki/app/shared/app_input_text2.dart';
import 'package:trucki/core/constant/app_colors.dart';
import 'package:trucki/core/constant/app_images.dart';
import 'package:trucki/core/constant/app_string.dart';
import 'package:trucki/core/constant/ui_helper.dart';
import 'package:trucki/features/authentication/presentation/pages/forgot_password_screen.dart';
import 'package:trucki/features/onboarding/presentation/pages/onboarding_screen.dart';

class LoginScreen extends StatefulWidget {
  static const String route = '/login_screen';
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isObsure = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 130,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(AppImages.registrationHeader),
                  fit: BoxFit.cover),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 20,
              right: 20,
            ),
            child: ListView(
              shrinkWrap: true,
              children: [
                gapMedium,
                const Text(
                  AppStrings.welcomeBack,
                  style: headerTextStyle,
                ),
                gapTiny,
                const Text(
                  AppStrings.welcomeBackSubtitle,
                  style: bodyTextStyle,
                ),
                gapLarge,
                const Text(
                  AppStrings.phoneNumber,
                  style: subHeaderTextStyle,
                ),
                gapTiny,
                const CustomInputText2(
                  inputType: TextInputType.name,
                  hint: AppStrings.enterPhoneNumber,
                ),
                gapMedium,
                const Text(
                  AppStrings.password,
                  style: subHeaderTextStyle,
                ),
                gapTiny,
                CustomInputText2(
                  inputType: TextInputType.name,
                  hint: "Enter your Password",
                  suffix: IconButton(
                      onPressed: () {
                        setState(() {
                          _isObsure = !_isObsure;
                        });
                      },
                      icon: Icon(!_isObsure ? Iconsax.eye : Iconsax.eye_slash)),
                  obscure: _isObsure,
                ),
                gapSmall,
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.pushNamed(
                          context, ForgotPasswordScreen.route),
                      child: Text(
                        AppStrings.forgotPassword,
                        style: bodyTextStyle.copyWith(
                            color: AppColor.primaryColor),
                      ),
                    ),
                  ],
                ),
                gapLarge,
                PrimaryBtn(title: AppStrings.logIn, onPress: () {}),
                gapMedium,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      AppStrings.dontHaveAnAccountYet,
                      style: bodyTextStyle,
                    ),
                    horizontalSpaceSmall,
                    GestureDetector(
                      onTap: () => Navigator.pushNamed(
                          context, IntroductionScreen.route),
                      child: Text(
                        AppStrings.register,
                        style: bodyTextStyle.copyWith(
                            color: AppColor.secondaryColor),
                      ),
                    ),
                  ],
                ),
                gapMedium,
              ],
            ),
          ),
        ],
      ),
    );
  }
}
