import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:trucki/app/shared/app_buttons.dart';
import 'package:trucki/app/shared/app_decoration.dart';
import 'package:trucki/app/shared/app_input_text2.dart';
import 'package:trucki/app/styels/ui_helper.dart';
import 'package:trucki/core/constant/app_colors.dart';
import 'package:trucki/core/constant/app_keys.dart';
import 'package:trucki/core/constant/app_storage.dart';
import 'package:trucki/core/constant/app_string.dart';
import 'package:trucki/core/constant/ui_helper.dart';
import 'package:trucki/features/authentication/presentation/pages/login_screen.dart';
import 'package:trucki/features/authentication/presentation/pages/trucks_details_screen.dart';

class TransporterDetailsScreen extends StatefulWidget {
  static const String route = '/transporter_detial_screen';
  const TransporterDetailsScreen({super.key});

  @override
  State<TransporterDetailsScreen> createState() =>
      _TransporterDetailsScreenState();
}

class _TransporterDetailsScreenState extends State<TransporterDetailsScreen> {
  List<DropdownMenuItem<String>> items = [
    DropdownMenuItem(
        value: 'One',
        child: Text(
          AppStrings.select,
          style: bodyTextStyle.copyWith(color: AppColor.textColor2),
        )),
    const DropdownMenuItem(value: 'Two', child: Text('Option 2')),
    const DropdownMenuItem(value: 'Three', child: Text('Option 3')),
  ];
  dynamic accountType;

  @override
  void initState() {
    getAccountType();
    super.initState();
  }

  getAccountType() async {
    String? type = await Prefs.getKey(AppKeys.accountType);
    setState(() {
      accountType = type;
    });
  }

  String dropdownValue = 'One';
  @override
  Widget build(BuildContext context) {
    print("This is the account type: $accountType");
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
            Container(
              height: 5,
              width: screenWidth(context, 2.3),
              color: AppColor.text3Color,
              child: TweenAnimationBuilder<double>(
                duration: const Duration(milliseconds: 30000),
                curve: Curves.linear,
                tween: Tween<double>(
                  begin: 0,
                  end: 55,
                ),
                builder: (context, value, _) => const LinearProgressIndicator(
                    color: AppColor.secondaryColor,
                    value: 0.5,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(15),
                      bottomRight: Radius.circular(14),
                    ),
                    minHeight: 10),
              ),
            ),
            gapMedium,
            if (accountType == "1") ...[
              const Text(
                AppStrings.transporterDetails,
                style: headerTextStyle,
              ),
            ] else if (accountType == "3") ...[
              const Text(
                AppStrings.fleetOwner,
                style: headerTextStyle,
              ),
            ],
            gapMedium,
            const Text(
              AppStrings.transporterDetailsSubtitle,
              style: bodyTextStyle,
            ),
            gapMedium,
            gapSmall,
            const Text(
              AppStrings.fullNameBusinessName,
              style: subHeaderTextStyle,
            ),
            gapTiny,
            const CustomInputText2(
              inputType: TextInputType.name,
              hint: AppStrings.fullNameBusinessNamePlaceHolder,
            ),
            gapMedium,
            const Text(
              AppStrings.emailAddress,
              style: subHeaderTextStyle,
            ),
            gapTiny,
            const CustomInputText2(
              inputType: TextInputType.name,
              hint: AppStrings.emailAddressPlaceHolder,
            ),
            gapMedium,
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
              AppStrings.location,
              style: subHeaderTextStyle,
            ),
            gapTiny,
            GestureDetector(
              onTap: () {},
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  color: AppColor.primaryLiteColor.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: DropdownButton<String>(
                    isExpanded: true,
                    icon: const Icon(Iconsax.arrow_down_1_copy),
                    underline: Container(
                      color: Colors.transparent,
                      height: 0,
                    ),
                    value: dropdownValue,
                    onChanged: (newValue) {
                      setState(() {
                        dropdownValue = newValue!;
                      });
                    },
                    items: items,
                  ),
                ),
              ),
            ),
            gapMedium,
            const Text(
              AppStrings.numberOfDrivers,
              style: subHeaderTextStyle,
            ),
            gapTiny,
            const CustomInputText2(
              inputType: TextInputType.name,
              hint: AppStrings.numberOfDrivers,
            ),
            gapLarge,
            PrimaryBtn(
                title: AppStrings.continueTxt,
                onPress: () {
                  Navigator.pushNamed(context, TruckDetailScreen.route);
                }),
            gapMedium,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  AppStrings.alreadyHaveAnAccount,
                  style: bodyTextStyle,
                ),
                horizontalSpaceSmall,
                GestureDetector(
                  onTap: () => Navigator.pushNamed(context, LoginScreen.route),
                  child: Text(
                    AppStrings.logIn,
                    style:
                        bodyTextStyle.copyWith(color: AppColor.secondaryColor),
                  ),
                ),
              ],
            ),
            gapLarge,
          ],
        ),
      ),
    );
  }
}
