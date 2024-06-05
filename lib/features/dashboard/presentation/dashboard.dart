// ignore_for_file: unused_field

import 'package:flutter/material.dart';
import 'package:trucki/app/shared/app_decoration.dart';
import 'package:trucki/core/constant/app_colors.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:trucki/core/constant/app_icons.dart';
import 'package:trucki/core/constant/app_keys.dart';
import 'package:trucki/core/constant/app_storage.dart';
import 'package:trucki/features/home/presentation/pages/home.dart';
import 'package:trucki/features/drivers/presentation/pages/driver.dart';
import 'package:trucki/features/account/presentation/pages/account.dart';
import 'package:trucki/features/logs/presentation/pages/log_screen.dart';
import 'package:trucki/features/trucks/presentation/pages/truckes_screen.dart';

class DashboardScreen extends StatefulWidget {
  static const String route = '/dashboard';
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  late int _currentIndex;
  late List<Widget> _children;
  dynamic accountType;

  getAccountType() async {
    String? type = await Prefs.getKey(AppKeys.accountType);
    print("account type: $type");
    setState(() {
      accountType = type;
    });
  }

  @override
  void initState() {
    _currentIndex = 0;

    getAccountType();
    if (accountType == 3) {
      _children = [
        const HomeScreen(),
        const LogScreen(),
        const TruckScreen(),
        const AccountScreen(),
      ];
    } else {
      _children = [
        const HomeScreen(),
        const DriverScreen(),
        const AccountScreen(),
      ];
    }

    super.initState();
  }

  int currentTab = 0;
  final List<Widget> screens = [];

  Widget currentScreen = const HomeScreen();
  final PageStorageBucket bucket = PageStorageBucket();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: bottomNav(),
      body: PageStorage(
        bucket: bucket,
        child: currentScreen,
      ),
    );
  }

  BottomAppBar bottomNav() {
    return BottomAppBar(
      height: 80,
      color: AppColor.lightColor,
      elevation: 0.3,
      shape: const CircularNotchedRectangle(),
      child: Container(
        child: Padding(
          padding: const EdgeInsets.only(top: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              if (accountType == "1") ...[
                GestureDetector(
                  onTap: () {
                    setState(() {
                      currentScreen = const HomeScreen();
                      currentTab = 0;
                    });
                  },
                  child: Column(
                    children: [
                      SvgPicture.asset(
                        AppIcons.home,
                        colorFilter: currentTab == 0
                            ? const ColorFilter.mode(
                                AppColor.primaryColor,
                                BlendMode.srcIn,
                              )
                            : const ColorFilter.mode(
                                AppColor.darkColor, BlendMode.srcIn),
                        width: 24,
                        height: 24,
                      ),
                      Text(
                        "home",
                        style: bodyTextStyle.copyWith(
                          color: currentTab == 0
                              ? AppColor.primaryColor
                              : AppColor.darkColor,
                        ),
                      )
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      currentScreen = const DriverScreen();
                      currentTab = 1;
                    });
                  },
                  child: Column(
                    children: [
                      SvgPicture.asset(
                        AppIcons.driver,
                        colorFilter: currentTab == 1
                            ? const ColorFilter.mode(
                                AppColor.primaryColor,
                                BlendMode.srcIn,
                              )
                            : const ColorFilter.mode(
                                AppColor.darkColor, BlendMode.srcIn),
                        width: 24,
                        height: 24,
                      ),
                      Text(
                        "Drivers",
                        style: bodyTextStyle.copyWith(
                          color: currentTab == 1
                              ? AppColor.primaryColor
                              : AppColor.darkColor,
                        ),
                      )
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      currentScreen = const AccountScreen();
                      currentTab = 2;
                    });
                  },
                  child: Column(
                    children: [
                      SvgPicture.asset(
                        AppIcons.user,
                        colorFilter: currentTab == 2
                            ? const ColorFilter.mode(
                                AppColor.primaryColor,
                                BlendMode.srcIn,
                              )
                            : const ColorFilter.mode(
                                AppColor.darkColor, BlendMode.srcIn),
                        width: 24,
                        height: 24,
                      ),
                      Text(
                        "Account",
                        style: bodyTextStyle.copyWith(
                          color: currentTab == 2
                              ? AppColor.primaryColor
                              : AppColor.darkColor,
                        ),
                      )
                    ],
                  ),
                ),
              ] else if (accountType == "3") ...[
                GestureDetector(
                  onTap: () {
                    setState(() {
                      currentScreen = const HomeScreen();
                      currentTab = 0;
                    });
                  },
                  child: Column(
                    children: [
                      SvgPicture.asset(
                        AppIcons.home,
                        colorFilter: currentTab == 0
                            ? const ColorFilter.mode(
                                AppColor.primaryColor,
                                BlendMode.srcIn,
                              )
                            : const ColorFilter.mode(
                                AppColor.darkColor, BlendMode.srcIn),
                        width: 24,
                        height: 24,
                      ),
                      Text(
                        "home",
                        style: bodyTextStyle.copyWith(
                          color: currentTab == 0
                              ? AppColor.primaryColor
                              : AppColor.darkColor,
                        ),
                      )
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      currentScreen = const TruckScreen();
                      currentTab = 1;
                    });
                  },
                  child: Column(
                    children: [
                      SvgPicture.asset(
                        AppIcons.truck,
                        colorFilter: currentTab == 1
                            ? const ColorFilter.mode(
                                AppColor.primaryColor,
                                BlendMode.srcIn,
                              )
                            : const ColorFilter.mode(
                                AppColor.darkColor, BlendMode.srcIn),
                        width: 24,
                        height: 24,
                      ),
                      Text(
                        "Truck",
                        style: bodyTextStyle.copyWith(
                          color: currentTab == 1
                              ? AppColor.primaryColor
                              : AppColor.darkColor,
                        ),
                      )
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      currentScreen = const LogScreen();
                      currentTab = 2;
                    });
                  },
                  child: Column(
                    children: [
                      SvgPicture.asset(
                        AppIcons.log,
                        colorFilter: currentTab == 2
                            ? const ColorFilter.mode(
                                AppColor.primaryColor,
                                BlendMode.srcIn,
                              )
                            : const ColorFilter.mode(
                                AppColor.darkColor, BlendMode.srcIn),
                        width: 24,
                        height: 24,
                      ),
                      Text(
                        "Logs",
                        style: bodyTextStyle.copyWith(
                          color: currentTab == 2
                              ? AppColor.primaryColor
                              : AppColor.darkColor,
                        ),
                      )
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      currentScreen = const AccountScreen();
                      currentTab = 3;
                    });
                  },
                  child: Column(
                    children: [
                      SvgPicture.asset(
                        AppIcons.user,
                        colorFilter: currentTab == 3
                            ? const ColorFilter.mode(
                                AppColor.primaryColor,
                                BlendMode.srcIn,
                              )
                            : const ColorFilter.mode(
                                AppColor.darkColor, BlendMode.srcIn),
                        width: 24,
                        height: 24,
                      ),
                      Text(
                        "Account",
                        style: bodyTextStyle.copyWith(
                          color: currentTab == 3
                              ? AppColor.primaryColor
                              : AppColor.darkColor,
                        ),
                      )
                    ],
                  ),
                ),
              ]
            ],
          ),
        ),
      ),
    );
  }
}
