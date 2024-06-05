import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:trucki/app/shared/app_buttons.dart';
import 'package:trucki/app/shared/app_decoration.dart';
import 'package:trucki/app/shared/app_input_text2.dart';
import 'package:trucki/core/constant/app_string.dart';
import 'package:trucki/core/constant/ui_helper.dart';
import 'package:trucki/features/authentication/presentation/pages/reset_password_screen.dart';

class ForgotPasswordScreen extends StatefulWidget {
  static const String route = '/forget_password_screen';
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 22, right: 22),
        child: ListView(
          children: [
            gapLarge,
            Row(
              children: [
                GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(Iconsax.arrow_left_copy)),
              ],
            ),
            gapMedium,
            const Text(
              AppStrings.forgotPassword,
              style: headerTextStyle,
            ),
            gapTiny,
            const Text(
              AppStrings.forgotPasswordSubtitle,
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
            gapLarge,
            PrimaryBtn(
              title: AppStrings.submit,
              onPress: () {
                Navigator.pushNamed(context, ResetPasswordScreen.route);
              },
            ),
          ],
        ),
      ),
    );
  }
}
