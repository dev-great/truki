import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:trucki/app/shared/app_buttons.dart';
import 'package:trucki/app/shared/app_decoration.dart';
import 'package:trucki/app/shared/app_input_text2.dart';
import 'package:trucki/app/styels/ui_helper.dart';
import 'package:trucki/core/constant/app_colors.dart';
import 'package:trucki/core/constant/app_string.dart';
import 'package:trucki/core/constant/ui_helper.dart';

class DriverScreen extends StatefulWidget {
  static const String route = '/driver';
  const DriverScreen({super.key});

  @override
  State<DriverScreen> createState() => _DriverScreenState();
}

class _DriverScreenState extends State<DriverScreen> {
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
          title: const Text(AppStrings.driver, style: subHeaderTextStyle),
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
                leading: const CircleAvatar(
                  radius: 20,
                  backgroundImage: NetworkImage(
                      "https://images.unsplash.com/photo-1494790108377-be9c29b29330?q=80&w=1287&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"),
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
                        leading: Icon(
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
                height: screenHeight(context, 2.1),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Row(
                      children: [
                        Text(
                          AppStrings.driverDetails,
                          style: subHeaderTextStyle,
                        ),
                        gapMedium,
                      ],
                    ),
                    gapMedium,
                    CircleAvatar(
                      radius: 30,
                    ),
                    gapTiny,
                    Row(
                      children: [
                        Icon(
                          Icons.cloud_upload,
                          size: 15,
                          color: AppColor.primaryColor,
                        ),
                        horizontalSpaceTiny,
                        Text(
                          AppStrings.uploadImage,
                          style: bodyTextStyle.copyWith(
                            color: AppColor.primaryColor,
                          ),
                        )
                      ],
                    ),
                    gapMedium,
                    const Row(
                      children: [
                        Text(
                          "Name",
                          style: bodyTextStyle,
                        ),
                      ],
                    ),
                    gapTiny,
                    Text(
                      "Greatness Marshal",
                      style: tinyTextStyle,
                    ),
                    gapSmall,
                    const Row(
                      children: [
                        Text(
                          AppStrings.phoneNumber,
                          style: bodyTextStyle,
                        ),
                      ],
                    ),
                    gapTiny,
                    Text(
                      "08171878521",
                      style: tinyTextStyle,
                    ),
                    gapSmall,
                    const Row(
                      children: [
                        Text(
                          AppStrings.emailAddress,
                          style: bodyTextStyle,
                        ),
                      ],
                    ),
                    gapTiny,
                    Text(
                      "Johndoe@gmail.com",
                      style: tinyTextStyle,
                    ),
                    gapSmall,
                    Text(
                      AppStrings.address,
                      style: bodyTextStyle,
                    ),
                    gapTiny,
                    Text(
                      "Plot 58a, Omorinre Johnson street, Lekki 1",
                      style: tinyTextStyle,
                    ),
                    gapSmall,
                    Text(
                      AppStrings.drivingExperience,
                      style: bodyTextStyle,
                    ),
                    gapTiny,
                    Text(
                      "5",
                      style: tinyTextStyle,
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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Row(
                      children: [
                        Text(
                          AppStrings.addDriver,
                          style: subHeaderTextStyle,
                        ),
                        gapMedium,
                      ],
                    ),
                    gapMedium,
                    CircleAvatar(
                      radius: 30,
                    ),
                    gapTiny,
                    Row(
                      children: [
                        Icon(
                          Icons.cloud_upload,
                          size: 15,
                          color: AppColor.primaryColor,
                        ),
                        horizontalSpaceTiny,
                        Text(
                          AppStrings.uploadImage,
                          style: bodyTextStyle.copyWith(
                            color: AppColor.primaryColor,
                          ),
                        )
                      ],
                    ),
                    gapMedium,
                    const Row(
                      children: [
                        Text(
                          "Name",
                          style: bodyTextStyle,
                        ),
                      ],
                    ),
                    gapTiny,
                    const CustomInputText2(
                      inputType: TextInputType.name,
                      hint: "Enter Name",
                    ),
                    gapSmall,
                    const Row(
                      children: [
                        Text(
                          AppStrings.phoneNumber,
                          style: bodyTextStyle,
                        ),
                      ],
                    ),
                    gapTiny,
                    const CustomInputText2(
                      inputType: TextInputType.name,
                      hint: AppStrings.enterPhoneNumber,
                    ),
                    gapSmall,
                    const Row(
                      children: [
                        Text(
                          AppStrings.emailAddress,
                          style: bodyTextStyle,
                        ),
                      ],
                    ),
                    gapTiny,
                    const CustomInputText2(
                      inputType: TextInputType.name,
                      hint: AppStrings.emailAddressPlaceHolder,
                    ),
                    gapSmall,
                    const Row(
                      children: [
                        Text(
                          AppStrings.address,
                          style: bodyTextStyle,
                        ),
                      ],
                    ),
                    gapTiny,
                    const CustomInputText2(
                      inputType: TextInputType.name,
                      hint: "Enter Address",
                    ),
                    gapSmall,
                    const Row(
                      children: [
                        Text(
                          AppStrings.drivingExperience,
                          style: bodyTextStyle,
                        ),
                      ],
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
                    PrimaryBtn(
                      title: AppStrings.submit,
                      onPress: () {},
                    ),
                    gapMedium,
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }
}
