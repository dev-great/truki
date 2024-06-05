import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:trucki/app/shared/app_decoration.dart';
import 'package:trucki/app/styels/ui_helper.dart';
import 'package:trucki/core/constant/app_colors.dart';
import 'package:trucki/core/constant/app_images.dart';
import 'package:trucki/core/constant/app_keys.dart';
import 'package:trucki/core/constant/app_storage.dart';
import 'package:trucki/core/constant/app_string.dart';
import 'package:trucki/core/constant/ui_helper.dart';
import 'package:trucki/features/orders/presentation/pages/order_detail_screen.dart';
import 'package:trucki/features/orders/presentation/pages/order_screen.dart';
import 'package:trucki/features/widgets/fleet_card.dart';
import 'package:trucki/features/widgets/order_card.dart';

class HomeScreen extends StatefulWidget {
  static const String route = '/home';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  dynamic accountType;

  getAccountType() async {
    String? type = await Prefs.getKey(AppKeys.accountType);
    setState(() {
      accountType = type;
    });
  }

  @override
  void initState() {
    getAccountType();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            color: AppColor.primaryColor,
            height: 120,
            child: Padding(
              padding: const EdgeInsets.only(top: 55, left: 30, right: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const CircleAvatar(
                    radius: 22,
                    backgroundImage: NetworkImage(
                      "https://img.freepik.com/free-psd/3d-illustration-human-avatar-profile_23-2150671142.jpg?w=1060&t=st=1715357191~exp=1715357791~hmac=31be0b8c2930c844960c6b9c14cc20edd6295fdd326050a19839bab9d2dcaa6b",
                    ),
                  ),
                  horizontalSpaceSmall,
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Welcome,',
                        style: subHeaderTextStyle.copyWith(
                          color: AppColor.lightColor,
                        ),
                      ),
                      gapTiny,
                      Text(
                        'ABC Logistics',
                        style:
                            tinyTextStyle.copyWith(color: AppColor.lightColor),
                      ),
                    ],
                  ),
                  const Spacer(),
                  const CircleAvatar(
                    radius: 15,
                    child: Icon(
                      Iconsax.notification,
                      size: 18,
                    ),
                  )
                ],
              ),
            ),
          ),
          gapMedium,
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      height: 80,
                      width: screenWidth(context, 1),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AppColor.primaryColor,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          gapSmall,
                          Text(
                            AppStrings.totalEarnings,
                            style: bodyTextStyle.copyWith(
                                color: AppColor.lightColor),
                          ),
                          Text(
                            "N350,000",
                            style: headerTextStyle.copyWith(
                                color: AppColor.lightColor),
                          ),
                          gapSmall,
                        ],
                      ),
                    ),
                    Positioned(
                      right: 2,
                      child: SizedBox(
                          height: 80,
                          width: 80,
                          child: Image.asset(AppImages.handWithMoney)),
                    )
                  ],
                ),
                gapMedium,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: AppColor.ashColor,
                              borderRadius: BorderRadius.circular(10)),
                          height: 114,
                          width: screenWidth(context, 2.4),
                          child: Padding(
                            padding: const EdgeInsets.all(14.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "35",
                                  style: headerTextStyle,
                                ),
                                gapTiny,
                                Text(
                                  AppStrings.totalTripsPerWeek,
                                  style: bodyTextStyle.copyWith(
                                      color: AppColor.textColor2),
                                )
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          right: 0,
                          bottom: 0,
                          child: SizedBox(
                              height: 70,
                              width: 70,
                              child: Image.asset(AppImages.blueTruck)),
                        )
                      ],
                    ),
                    Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: AppColor.secondaryLiteColor,
                              borderRadius: BorderRadius.circular(10)),
                          height: 114,
                          width: screenWidth(context, 2.4),
                          child: Padding(
                            padding: const EdgeInsets.all(14.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "35",
                                  style: headerTextStyle,
                                ),
                                gapTiny,
                                Text(
                                  AppStrings.totalTripsPerMonth,
                                  style: bodyTextStyle.copyWith(
                                      color: AppColor.textColor2),
                                )
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          right: 0,
                          bottom: 0,
                          child: SizedBox(
                              height: 70,
                              width: 70,
                              child: Image.asset(AppImages.orangeTruck)),
                        )
                      ],
                    ),
                  ],
                ),
                if (accountType == "3") ...[
                  gapMedium,
                  Container(
                    height: 135,
                    width: screenWidth(context, 1.1),
                    decoration: BoxDecoration(
                      color: AppColor.ashColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          gapSmall,
                          const Text(
                            "Trucks Status",
                            style: bodyTextStyle,
                          ),
                          gapSmall,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Available",
                                style: tinyTextStyle,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: AppColor.sucessColor,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                    left: 8,
                                    right: 8,
                                    top: 2,
                                    bottom: 2,
                                  ),
                                  child: Center(
                                    child: Text(
                                      "8",
                                      style: tinyTextStyle.copyWith(
                                          color: AppColor.whiteColor),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          gapSmall,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Out of Service",
                                style: tinyTextStyle,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: AppColor.errorColor,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                    left: 8,
                                    right: 8,
                                    top: 2,
                                    bottom: 2,
                                  ),
                                  child: Center(
                                    child: Text(
                                      "35",
                                      style: tinyTextStyle.copyWith(
                                          color: AppColor.whiteColor),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          gapSmall,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "In Active",
                                style: tinyTextStyle,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: AppColor.warningColor,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                    left: 8,
                                    right: 8,
                                    top: 2,
                                    bottom: 2,
                                  ),
                                  child: Center(
                                    child: Text(
                                      "5",
                                      style: tinyTextStyle.copyWith(
                                          color: AppColor.whiteColor),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                ],
                gapMedium,
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, OrderScreen.route);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      if (accountType == "1") ...[
                        const Text(
                          AppStrings.pendingOrders,
                          style: subHeaderTextStyle,
                        ),
                      ] else ...[
                        const Text(
                          "Recent Maintenance",
                          style: subHeaderTextStyle,
                        ),
                      ],
                      const Row(
                        children: [
                          Text(
                            AppStrings.seeAll,
                            style: bodyTextStyle,
                          ),
                          horizontalSpaceTiny,
                          Icon(
                            Iconsax.arrow_right_2_copy,
                            size: 20,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                gapMedium,
                if (accountType == "1") ...[
                  ListView.builder(
                    itemCount: 3,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(
                                context, OrderDetailsScreen.route);
                          },
                          child: const OrderCard());
                    },
                  ),
                ] else ...[
                  ListView.builder(
                    itemCount: 3,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return const FleetTruckCard();
                    },
                  ),
                ],
              ],
            ),
          )
        ],
      ),
    );
  }
}
