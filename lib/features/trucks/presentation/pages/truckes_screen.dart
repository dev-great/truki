import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:trucki/app/shared/app_buttons.dart';
import 'package:trucki/app/shared/app_date_selector.dart';
import 'package:trucki/app/shared/app_decoration.dart';
import 'package:trucki/app/styels/ui_helper.dart';
import 'package:trucki/core/constant/app_colors.dart';
import 'package:trucki/core/constant/app_string.dart';
import 'package:trucki/core/constant/ui_helper.dart';
import 'package:intl/intl.dart';
import '../../../../app/shared/app_input_text2.dart';

class TruckScreen extends StatefulWidget {
  static const String route = '/truck';
  const TruckScreen({super.key});

  @override
  State<TruckScreen> createState() => _TruckScreenState();
}

class _TruckScreenState extends State<TruckScreen> {
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

  String dropdownValue = 'One';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100.0),
        child: AppBar(
          backgroundColor: AppColor.ashColor,
          automaticallyImplyLeading: false,
          title: const Text("Trucks", style: subHeaderTextStyle),
          toolbarHeight: kToolbarHeight + 50,
          elevation: 0,
          centerTitle: false,
          actions: const [],
        ),
      ),
      floatingActionButton: CircleAvatar(
        radius: 30,
        backgroundColor: AppColor.primaryColor,
        child: IconButton(
            onPressed: () {
              _addDriver(context);
            },
            icon: const Icon(
              Icons.add,
              color: AppColor.lightColor,
            )),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          left: 10,
          right: 10,
          top: 10,
        ),
        child: ListView.builder(
          itemCount: 2,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: ListTile(
                tileColor: AppColor.whiteColor,
                leading: CircleAvatar(
                  backgroundColor: AppColor.text3Color.withOpacity(0.3),
                  radius: 20,
                  child: const Icon(
                    Iconsax.truck_copy,
                    size: 20,
                    color: AppColor.primaryColor,
                  ),
                ),
                title: const Text(
                  "Gretness Marshal",
                  style: bodyTextStyle,
                ),
                subtitle: const Text(
                  "08171878521",
                  style: tinyTextStyle,
                ),
                trailing: PopupMenuButton<String>(
                  color: AppColor.whiteColor,
                  surfaceTintColor: AppColor.whiteColor,
                  itemBuilder: (BuildContext context) =>
                      <PopupMenuEntry<String>>[
                    const PopupMenuItem<String>(
                      value: 'View',
                      child: ListTile(
                        leading: Icon(
                          Iconsax.eye_copy,
                          size: 15,
                        ),
                        title: Text('View', style: bodyTextStyle),
                      ),
                    ),
                    const PopupMenuItem<String>(
                      value: 'Edit',
                      child: ListTile(
                        leading: Icon(
                          Iconsax.edit_copy,
                          size: 15,
                        ),
                        title: Text('Edit', style: bodyTextStyle),
                      ),
                    ),
                    PopupMenuItem<String>(
                      value: 'Delete',
                      child: ListTile(
                        leading: const Icon(
                          Iconsax.trash,
                          size: 15,
                          color: AppColor.errorColor,
                        ),
                        title: Text(
                          'Delete',
                          style: bodyTextStyle.copyWith(
                            color: AppColor.errorColor,
                          ),
                        ),
                      ),
                    ),
                  ],
                  onSelected: (String value) {
                    switch (value) {
                      case 'Edit':
                        _addDriver(context);
                        break;
                      case 'Delete':
                        break;
                      case 'View':
                        _viewDriver(context);
                        break;
                    }
                  },
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  void _viewDriver(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: AppColor.whiteColor,
          surfaceTintColor: AppColor.whiteColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: const Icon(Iconsax.close_circle_copy),
              )
            ],
          ),
          content: StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
              return SizedBox(
                height: screenHeight(context, 1.7),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Row(
                      children: [
                        Text(
                          AppStrings.truckDetails,
                          style: subHeaderTextStyle,
                        ),
                        gapMedium,
                      ],
                    ),
                    gapMedium,
                    const Row(
                      children: [
                        Text(
                          "Truck Type",
                          style: bodyTextStyle,
                        ),
                      ],
                    ),
                    gapTiny,
                    const Text(
                      "Thundra",
                      style: tinyTextStyle,
                    ),
                    gapSmall,
                    const Row(
                      children: [
                        Text(
                          "Plate Number",
                          style: bodyTextStyle,
                        ),
                      ],
                    ),
                    gapTiny,
                    const Text(
                      "KJA1234",
                      style: tinyTextStyle,
                    ),
                    gapSmall,
                    const Row(
                      children: [
                        Text(
                          "Capacity",
                          style: bodyTextStyle,
                        ),
                      ],
                    ),
                    gapTiny,
                    const Text(
                      "20 tons",
                      style: tinyTextStyle,
                    ),
                    gapSmall,
                    const Text(
                      AppStrings.address,
                      style: bodyTextStyle,
                    ),
                    gapTiny,
                    const Text(
                      "Plot 58a, Omorinre Johnson street, Lekki 1",
                      style: tinyTextStyle,
                    ),
                    gapSmall,
                    const Text(
                      "License Expiry Date",
                      style: bodyTextStyle,
                    ),
                    gapTiny,
                    const Text(
                      "Jan 24, 2026",
                      style: tinyTextStyle,
                    ),
                    gapSmall,
                    const Text(
                      "Road Worthiness Expiry Date",
                      style: bodyTextStyle,
                    ),
                    gapTiny,
                    const Text(
                      "Jan 24, 2026",
                      style: tinyTextStyle,
                    ),
                    gapSmall,
                    const Text(
                      "Insurance Expiry Date",
                      style: bodyTextStyle,
                    ),
                    gapTiny,
                    const Text(
                      "Jan 24, 2026",
                      style: tinyTextStyle,
                    ),
                    gapSmall,
                    Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: Container(
                        decoration: BoxDecoration(
                          color: AppColor.ashColor,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(9.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Icon(
                                Iconsax.image,
                                color: AppColor.warningColor,
                                size: 20,
                              ),
                              const Text(
                                "Truck Insurance.JPG",
                                style: tinyTextStyle,
                              ),
                              horizontalSpaceSmall,
                              Text(
                                "View File",
                                style: tinyTextStyle.copyWith(
                                  decoration: TextDecoration.underline,
                                  color: AppColor.primaryColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    gapSmall,
                    const Text(
                      "Truck Status",
                      style: bodyTextStyle,
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
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }

  void _addDriver(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: AppColor.whiteColor,
          surfaceTintColor: AppColor.whiteColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: const Icon(Iconsax.close_circle_copy),
              )
            ],
          ),
          content: StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
              return Container(
                color: AppColor.whiteColor,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Row(
                        children: [
                          Text(
                            "Add Truck",
                            style: subHeaderTextStyle,
                          ),
                          gapMedium,
                        ],
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
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              GestureDetector(
                                                onTap: () =>
                                                    Navigator.pop(context),
                                                child: const Icon(
                                                    Iconsax.close_circle_copy),
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
                                              borderRadius:
                                                  const BorderRadius.all(
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
                                                      Icons
                                                          .cloud_upload_outlined,
                                                      color:
                                                          AppColor.primaryColor,
                                                    ),
                                                    gapTiny,
                                                    Text(
                                                      AppStrings
                                                          .selectFileToUpload,
                                                      style: subHeaderTextStyle
                                                          .copyWith(
                                                        decoration:
                                                            TextDecoration
                                                                .underline,
                                                        color: AppColor
                                                            .primaryColor,
                                                      ),
                                                    ),
                                                    gapTiny,
                                                    Text(
                                                      AppStrings
                                                          .suppportedFromartsAre,
                                                      style: bodyTextStyle
                                                          .copyWith(
                                                        color: AppColor
                                                            .primaryColor,
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
                                                  text: AppStrings
                                                      .sampleExcelTemplate,
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
                            tileColor:
                                AppColor.primaryLiteColor.withOpacity(0.3),
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
                          borderRadius:
                              const BorderRadius.all(Radius.circular(12)),
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
                        hint: DateFormat(' M/d/y')
                            .format(dateOfDate ?? DateTime.now()),
                        onDateSelected: () => selectDate(context,
                            DateTime(1980), DateTime(2005), DateTime(2000)),
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
                        hint: DateFormat(' M/d/y')
                            .format(dateOfDate ?? DateTime.now()),
                        onDateSelected: () => selectDate(context,
                            DateTime(1980), DateTime(2005), DateTime(2000)),
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
                        hint: DateFormat(' M/d/y')
                            .format(dateOfDate ?? DateTime.now()),
                        onDateSelected: () => selectDate(context,
                            DateTime(1980), DateTime(2005), DateTime(2000)),
                      ),
                      gapLarge,
                      PrimaryBtn(title: AppStrings.register, onPress: () {}),
                      gapLarge,
                    ],
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
