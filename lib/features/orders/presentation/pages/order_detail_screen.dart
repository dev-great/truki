import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:trucki/app/shared/app_buttons.dart';
import 'package:trucki/app/shared/app_decoration.dart';
import 'package:trucki/app/shared/app_dialog.dart';
import 'package:trucki/app/shared/app_input_text2.dart';
import 'package:trucki/app/styels/ui_helper.dart';
import 'package:trucki/core/constant/app_colors.dart';
import 'package:trucki/core/constant/app_string.dart';
import 'package:trucki/core/constant/ui_helper.dart';

class OrderDetailsScreen extends StatefulWidget {
  static const String route = '/order_details';
  const OrderDetailsScreen({super.key});

  @override
  State<OrderDetailsScreen> createState() => _OrderDetailsScreenState();
}

class _OrderDetailsScreenState extends State<OrderDetailsScreen> {
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
      body: ListView(
        children: [
          Container(
            color: AppColor.ashColor,
            height: 120,
            child: const Padding(
              padding: EdgeInsets.only(top: 20, left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(Iconsax.arrow_left_copy),
                  horizontalSpaceMedium,
                  horizontalSpaceMedium,
                  horizontalSpaceMedium,
                  horizontalSpaceMedium,
                  Text('Order Details', style: subHeaderTextStyle),
                ],
              ),
            ),
          ),
          gapMedium,
          Padding(
            padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
            child: Column(
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Order ID:",
                      style: tinyTextStyle,
                    ),
                    Text(
                      "#TRU1234",
                      style: bodyTextStyle,
                    ),
                  ],
                ),
                const Divider(),
                gapSmall,
                Row(
                  children: [
                    Text(
                      AppStrings.pickUpDetails,
                      style:
                          bodyTextStyle.copyWith(color: AppColor.primaryColor),
                    ),
                  ],
                ),
                gapTiny,
                gapTiny,
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Customer’s Name",
                      style: tinyTextStyle,
                    ),
                    Text(
                      "Address",
                      style: tinyTextStyle,
                    ),
                  ],
                ),
                gapTiny,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "HoneyWell, Isolo",
                      style: tinyTextStyle.copyWith(color: AppColor.darkColor),
                    ),
                    Text(
                      "2, Isolo road, Lagos",
                      style: tinyTextStyle.copyWith(color: AppColor.darkColor),
                    ),
                  ],
                ),
                gapTiny,
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Phone Number",
                      style: tinyTextStyle,
                    ),
                    Text(
                      "Pick-up Time",
                      style: tinyTextStyle,
                    ),
                  ],
                ),
                gapTiny,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "08171878521",
                      style: tinyTextStyle.copyWith(color: AppColor.darkColor),
                    ),
                    Text(
                      "1:00 pm",
                      style: tinyTextStyle.copyWith(color: AppColor.darkColor),
                    ),
                  ],
                ),
                gapTiny,
                const Divider(),
                gapSmall,
                Row(
                  children: [
                    Text(
                      AppStrings.deliveryDetails,
                      style:
                          bodyTextStyle.copyWith(color: AppColor.primaryColor),
                    ),
                  ],
                ),
                gapTiny,
                gapTiny,
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Customer’s Name",
                      style: tinyTextStyle,
                    ),
                    Text(
                      "Address",
                      style: tinyTextStyle,
                    ),
                  ],
                ),
                gapTiny,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Debby Confectionaries",
                      style: tinyTextStyle.copyWith(color: AppColor.darkColor),
                    ),
                    Text(
                      "2, Kuto, Abeokuta",
                      style: tinyTextStyle.copyWith(color: AppColor.darkColor),
                    ),
                  ],
                ),
                gapTiny,
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Phone Number",
                      style: tinyTextStyle,
                    ),
                    Text(
                      "Delivery Time",
                      style: tinyTextStyle,
                    ),
                  ],
                ),
                gapTiny,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "08171878521",
                      style: tinyTextStyle.copyWith(color: AppColor.darkColor),
                    ),
                    Text(
                      "1:00 pm",
                      style: tinyTextStyle.copyWith(color: AppColor.darkColor),
                    ),
                  ],
                ),
                gapTiny,
                const Divider(),
                gapSmall,
                Row(
                  children: [
                    Text(
                      AppStrings.tripInfo,
                      style:
                          bodyTextStyle.copyWith(color: AppColor.primaryColor),
                    ),
                  ],
                ),
                gapSmall,
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Total Trip Distance",
                      style: tinyTextStyle,
                    ),
                    gapTiny,
                    Text(
                      "Estimated Time of Arrival",
                      style: tinyTextStyle,
                    ),
                  ],
                ),
                gapTiny,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "1.00 Km",
                      style: tinyTextStyle.copyWith(color: AppColor.darkColor),
                    ),
                    gapTiny,
                    Text(
                      "4h 10min",
                      style: tinyTextStyle.copyWith(color: AppColor.darkColor),
                    ),
                  ],
                ),
                gapMedium,
                Container(
                  height: 40,
                  decoration: const BoxDecoration(
                    color: AppColor.ashColor,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Cost of Delivery",
                          style: tinyTextStyle,
                        ),
                        Text(
                          "N100,000",
                          style: bodyTextStyle.copyWith(
                              color: AppColor.primaryColor),
                        ),
                      ],
                    ),
                  ),
                ),
                gapTiny,
                const Divider(),
                gapSmall,
                Row(
                  children: [
                    Text(
                      AppStrings.driverDetails,
                      style:
                          bodyTextStyle.copyWith(color: AppColor.primaryColor),
                    ),
                  ],
                ),
                gapSmall,
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Name",
                      style: tinyTextStyle,
                    ),
                    gapTiny,
                    Text(
                      AppStrings.amountToBePaid,
                      style: tinyTextStyle,
                    ),
                  ],
                ),
                gapTiny,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "John Doe",
                      style: tinyTextStyle.copyWith(color: AppColor.darkColor),
                    ),
                    gapTiny,
                    Text(
                      "N 50,000",
                      style: tinyTextStyle.copyWith(color: AppColor.darkColor),
                    ),
                  ],
                ),
                gapMedium,
                PrimaryBtn(
                    title: AppStrings.acceptOrder,
                    onPress: () {
                      _acceptOrder(context);
                    }),
                gapMedium,
              ],
            ),
          )
        ],
      ),
    );
  }

  void _acceptOrder(BuildContext context) {
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
                height: screenHeight(context, 2.6),
                child: Column(
                  children: [
                    const Row(
                      children: [
                        Text(
                          AppStrings.acceptOrder,
                          style: subHeaderTextStyle,
                        ),
                        gapMedium,
                      ],
                    ),
                    gapMedium,
                    const Row(
                      children: [
                        Text(
                          AppStrings.driver,
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
                    const Row(
                      children: [
                        Text(
                          AppStrings.amountToBePaidToDriver,
                          style: bodyTextStyle,
                        ),
                      ],
                    ),
                    gapTiny,
                    const CustomInputText2(
                      inputType: TextInputType.name,
                      prefix: Icon(Iconsax.coin_1_copy),
                      hint: AppStrings.numberOfDrivers,
                    ),
                    gapMedium,
                    PrimaryBtn(
                      title: AppStrings.submit,
                      onPress: () {
                        Navigator.pop(context);
                        showDialog(
                          barrierDismissible: true,
                          context: context,
                          builder: (_) => const AppDialog(
                            title: "Order can’t be Re-Assigned!",
                            subtitle:
                                'Order is in-transit already so it can’t be re-assigned to another driver.',
                          ),
                        );
                      },
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
