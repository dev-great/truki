import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:trucki/app/shared/app_buttons.dart';
import 'package:trucki/app/shared/app_date_selector.dart';
import 'package:trucki/app/shared/app_decoration.dart';
import 'package:trucki/app/shared/app_input_text2.dart';
import 'package:trucki/app/styels/ui_helper.dart';
import 'package:trucki/core/constant/app_colors.dart';
import 'package:trucki/core/constant/app_string.dart';
import 'package:trucki/core/constant/ui_helper.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:trucki/features/authentication/presentation/pages/allication_submited_screen.dart';

class TruckDetailScreen extends StatefulWidget {
  static const String route = '/truck_detail_screen';
  const TruckDetailScreen({super.key});

  @override
  State<TruckDetailScreen> createState() => _TruckDetailScreenState();
}

class _TruckDetailScreenState extends State<TruckDetailScreen> {
  final dateOfBirthController = TextEditingController();

  DateTime? _dateOfDate;
  DateTime? get dateOfDate => _dateOfDate;

  Future<void> selectDate(BuildContext context, DateTime firstDate,
      DateTime lastDate, DateTime initialDate) async {
    DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: firstDate,
      lastDate: lastDate,
    );

    if (selectedDate != null && selectedDate != initialDate) {
      _dateOfDate = selectedDate;
      dateOfBirthController.text = DateFormat(' M/d/y').format(selectedDate);
    }
  }

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
                    value: 1,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(15),
                      bottomRight: Radius.circular(14),
                    ),
                    minHeight: 10),
              ),
            ),
            gapMedium,
            const Text(
              AppStrings.truckDetails,
              style: headerTextStyle,
            ),
            gapTiny,
            const Text(
              AppStrings.truckDetailsSubtitle,
              style: bodyTextStyle,
            ),
            gapMedium,
            GestureDetector(
              onTap: () {
                showDialog(
                    barrierDismissible: false,
                    context: context,
                    builder: (_) => AlertDialog(
                        actionsPadding: EdgeInsets.zero,
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 20, horizontal: 10),
                        content: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: SizedBox(
                            height: screenHeight(context, 3.5),
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
                                gapTiny,
                                const Row(
                                  children: [
                                    Text(
                                      AppStrings.bulkUpload,
                                      style: headerTextStyle,
                                      textAlign: TextAlign.left,
                                    ),
                                  ],
                                ),
                                gapSmall,
                                DottedBorder(
                                  borderType: BorderType.RRect,
                                  radius: const Radius.circular(10),
                                  strokeWidth: 1,
                                  padding: const EdgeInsets.all(6),
                                  child: ClipRRect(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(12)),
                                    child: SizedBox(
                                      height: 110,
                                      width: screenWidth(context, 0),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          const Icon(
                                            Icons.cloud_upload_outlined,
                                            color: AppColor.primaryColor,
                                          ),
                                          gapTiny,
                                          Text(
                                            AppStrings.selectFileToUpload,
                                            style: subHeaderTextStyle.copyWith(
                                              decoration:
                                                  TextDecoration.underline,
                                              color: AppColor.primaryColor,
                                            ),
                                          ),
                                          gapTiny,
                                          Text(
                                            AppStrings.suppportedFromartsAre,
                                            style: bodyTextStyle.copyWith(
                                              color: AppColor.primaryColor,
                                            ),
                                          ),
                                          gapTiny,
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                gapSmall,
                                RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: AppStrings.download,
                                        style: bodyTextStyle.copyWith(
                                          color: AppColor.errorColor,
                                        ),
                                      ),
                                      const TextSpan(
                                        text: AppStrings.sampleExcelTemplate,
                                        style: bodyTextStyle,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        actions: const []));
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: AppColor.primaryColor,
                  ),
                ),
                child: ListTile(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  tileColor: AppColor.primaryLiteColor.withOpacity(0.3),
                  title: const Text(
                    AppStrings.bulkUpload,
                    style: subHeaderTextStyle,
                  ),
                  minVerticalPadding: 15,
                  subtitle: const Text(
                    AppStrings.bulkUploadPlaceHolder,
                    style: bodyTextStyle,
                  ),
                  trailing: const Icon(Iconsax.arrow_right_1_copy),
                ),
              ),
            ),
            gapMedium,
            DottedBorder(
              borderType: BorderType.RRect,
              radius: const Radius.circular(12),
              strokeWidth: 1,
              color: AppColor.primaryColor,
              dashPattern: const [5, 2],
              padding: const EdgeInsets.all(6),
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(12)),
                child: Container(
                  color: AppColor.primaryLiteColor.withOpacity(0.3),
                  height: 130,
                  width: screenWidth(context, 0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.cloud_upload_outlined,
                        size: 30,
                        color: AppColor.primaryColor,
                      ),
                      gapTiny,
                      Text(
                        AppStrings.uploadTruckDoc,
                        style: bodyTextStyle.copyWith(
                          color: AppColor.primaryColor,
                        ),
                      ),
                      gapTiny,
                      Text(
                        AppStrings.browseFiles,
                        style: subHeaderTextStyle.copyWith(
                          decoration: TextDecoration.underline,
                          color: AppColor.primaryColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            gapTiny,
            ListView.builder(
              shrinkWrap: true,
              itemCount: 4,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColor.ashColor,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(9.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Truck Insurance certificate. JPG",
                            style: bodyTextStyle,
                          ),
                          Icon(
                            Iconsax.trash,
                            color: AppColor.errorColor,
                            size: 15,
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
            gapMedium,
            const Text(
              AppStrings.truckType,
              style: subHeaderTextStyle,
            ),
            gapTiny,
            const CustomInputText2(
              inputType: TextInputType.name,
              hint: AppStrings.select,
            ),
            gapMedium,
            const Text(
              AppStrings.truckPlateNumber,
              style: subHeaderTextStyle,
            ),
            gapTiny,
            const CustomInputText2(
              inputType: TextInputType.name,
              hint: AppStrings.truckPlateNumberPlaceHolder,
            ),
            gapMedium,
            const Text(
              AppStrings.truckCapacity,
              style: subHeaderTextStyle,
            ),
            gapTiny,
            const CustomInputText2(
              inputType: TextInputType.name,
              hint: AppStrings.truckPlateNumberPlaceHolder,
            ),
            gapMedium,
            const Text(
              AppStrings.truckLicenseExpiryDate,
              style: subHeaderTextStyle,
            ),
            gapTiny,
            CustomDateRangeFormField(
              label: "Date of Birth",
              suffixIcon: const Icon(
                Iconsax.calendar_1_copy,
                size: 20,
              ),
              value: dateOfBirthController,
              hint: DateFormat(' M/d/y').format(dateOfDate ?? DateTime.now()),
              onDateSelected: () => selectDate(
                  context, DateTime(1980), DateTime(2005), DateTime(2000)),
            ),
            gapMedium,
            const Text(
              AppStrings.roadWorthinessExpiryDate,
              style: subHeaderTextStyle,
            ),
            gapTiny,
            CustomDateRangeFormField(
              label: "Date of Birth",
              suffixIcon: const Icon(
                Iconsax.calendar_1_copy,
                size: 20,
              ),
              value: dateOfBirthController,
              hint: DateFormat(' M/d/y').format(dateOfDate ?? DateTime.now()),
              onDateSelected: () => selectDate(
                  context, DateTime(1980), DateTime(2005), DateTime(2000)),
            ),
            gapMedium,
            const Text(
              AppStrings.insuranceExpiryDate,
              style: subHeaderTextStyle,
            ),
            gapTiny,
            CustomDateRangeFormField(
              label: "Date of Birth",
              suffixIcon: const Icon(
                Iconsax.calendar_1_copy,
                size: 20,
              ),
              value: dateOfBirthController,
              hint: DateFormat(' M/d/y').format(dateOfDate ?? DateTime.now()),
              onDateSelected: () => selectDate(
                  context, DateTime(1980), DateTime(2005), DateTime(2000)),
            ),
            gapLarge,
            PrimaryBtn(
                title: AppStrings.register,
                onPress: () {
                  Navigator.pushNamed(context, ApplicationSubmitedScreen.route);
                }),
            gapLarge,
          ],
        ),
      ),
    );
  }
}
