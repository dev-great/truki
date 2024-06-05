import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:trucki/app/shared/app_decoration.dart';
import 'package:trucki/core/constant/app_colors.dart';
import 'package:trucki/core/constant/ui_helper.dart';

class AccountScreen extends StatefulWidget {
  static const String route = '/account';
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(100.0),
          child: AppBar(
            backgroundColor: AppColor.ashColor,
            automaticallyImplyLeading: false,
            title: const Text("Account", style: subHeaderTextStyle),
            toolbarHeight: kToolbarHeight + 50,
            elevation: 0,
            centerTitle: false,
            actions: const [],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: ListView(
            children: [
              gapMedium,
              Container(
                height: 103,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColor.ashColor),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const CircleAvatar(
                      radius: 22,
                      backgroundImage: NetworkImage(
                        "https://img.freepik.com/free-psd/3d-illustration-human-avatar-profile_23-2150671142.jpg?w=1060&t=st=1715357191~exp=1715357791~hmac=31be0b8c2930c844960c6b9c14cc20edd6295fdd326050a19839bab9d2dcaa6b",
                      ),
                    ),
                    gapTiny,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Iconsax.edit_2_copy,
                          size: 15,
                          color: AppColor.primaryColor,
                        ),
                        horizontalSpaceTiny,
                        Text(
                          "Edit Image",
                          style: bodyTextStyle.copyWith(
                            color: AppColor.primaryColor,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              gapMedium,
              Container(
                height: 230,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColor.whiteColor),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        backgroundColor: AppColor.text3Color,
                        radius: 15,
                        child: Icon(
                          Iconsax.user_copy,
                          color: AppColor.primaryColor,
                          size: 15,
                        ),
                      ),
                      title: Text(
                        "Greatness Marshal",
                        style: tinyTextStyle,
                      ),
                    ),
                    ListTile(
                      leading: CircleAvatar(
                        backgroundColor: AppColor.text3Color,
                        radius: 15,
                        child: Icon(
                          Iconsax.call_copy,
                          color: AppColor.primaryColor,
                          size: 15,
                        ),
                      ),
                      title: Text(
                        "08171878521",
                        style: tinyTextStyle,
                      ),
                    ),
                    ListTile(
                      leading: CircleAvatar(
                        backgroundColor: AppColor.text3Color,
                        radius: 15,
                        child: Icon(
                          Iconsax.sms_copy,
                          color: AppColor.primaryColor,
                          size: 15,
                        ),
                      ),
                      title: Text(
                        "JohnD@trucki.co",
                        style: tinyTextStyle,
                      ),
                    ),
                    ListTile(
                      leading: CircleAvatar(
                        backgroundColor: AppColor.text3Color,
                        radius: 15,
                        child: Icon(
                          Iconsax.location_copy,
                          color: AppColor.primaryColor,
                          size: 15,
                        ),
                      ),
                      title: Text(
                        "Plot 58a, Omorinre Johnson street, Lagos",
                        style: tinyTextStyle,
                      ),
                    ),
                  ],
                ),
              ),
              gapMassive,
              Container(
                  height: 60,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColor.whiteColor),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Icon(
                          Iconsax.logout_copy,
                          color: AppColor.errorColor,
                          size: 24,
                        ),
                        horizontalSpaceSmall,
                        Text(
                          "Log Out",
                          style: bodyTextStyle.copyWith(
                              color: AppColor.errorColor),
                        ),
                      ]))
            ],
          ),
        ));
  }
}
