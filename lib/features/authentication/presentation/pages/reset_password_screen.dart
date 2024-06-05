import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:trucki/app/shared/app_buttons.dart';
import 'package:trucki/app/shared/app_decoration.dart';
import 'package:trucki/app/shared/app_dialog.dart';
import 'package:trucki/app/shared/app_input_text2.dart';
import 'package:trucki/core/constant/app_string.dart';
import 'package:trucki/core/constant/ui_helper.dart';

class ResetPasswordScreen extends StatefulWidget {
  static const String route = '/reset_password_screen';
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  bool _isObsure = true;
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
              AppStrings.resetPassword,
              style: headerTextStyle,
            ),
            gapLarge,
            const Text(
              AppStrings.otpCode,
              style: subHeaderTextStyle,
            ),
            gapTiny,
            const CustomInputText2(
              inputType: TextInputType.name,
              hint: AppStrings.otpCodePlaceHoldet,
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
            gapMedium,
            const Text(
              AppStrings.confirmNewPassword,
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
            gapLarge,
            PrimaryBtn(
              title: AppStrings.submit,
              onPress: () {
                showDialog(
                  barrierDismissible: true,
                  context: context,
                  builder: (_) => AppDialog(
                    title: 'Password Reset Successful!',
                    subtitle:
                        'You have changed your password successfully. Login to continue to Trucki',
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
