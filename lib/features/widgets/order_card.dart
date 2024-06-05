import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:trucki/app/shared/app_decoration.dart';
import 'package:trucki/core/constant/app_colors.dart';
import 'package:trucki/core/constant/app_string.dart';
import 'package:trucki/core/constant/ui_helper.dart';

class OrderCard extends StatelessWidget {
  const OrderCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 140,
        decoration: BoxDecoration(
            color: AppColor.ashColor, borderRadius: BorderRadius.circular(10)),
        child: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    AppStrings.pickUP,
                    style: bodyTextStyle,
                  ),
                  horizontalSpaceSmall,
                  Text(
                    "---------------",
                    style: tinyTextStyle,
                  ),
                  horizontalSpaceSmall,
                  CircleAvatar(
                    radius: 15,
                    child: Icon(
                      Iconsax.truck_copy,
                      size: 14,
                    ),
                  ),
                  horizontalSpaceSmall,
                  Text(
                    "---------------",
                    style: tinyTextStyle,
                  ),
                  horizontalSpaceSmall,
                  Text(
                    AppStrings.delivery,
                    style: bodyTextStyle,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "HoneyWell, Isolo",
                    style: tinyTextStyle,
                  ),
                  Text(
                    "HoneyWell Depot",
                    style: tinyTextStyle,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "2, Isolo road, Lagos",
                    style: tinyTextStyle,
                  ),
                  Text(
                    "2, Kuto, Abeokuta",
                    style: tinyTextStyle,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "1:00 PM",
                    style: tinyTextStyle,
                  ),
                  Text(
                    "8:00 PM",
                    style: tinyTextStyle,
                  ),
                ],
              ),
              Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        Iconsax.speedometer_copy,
                        color: AppColor.errorColor,
                        size: 14,
                      ),
                      horizontalSpaceTiny,
                      Text(
                        "1.00 Km",
                        style: tinyTextStyle,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Iconsax.clock_copy,
                        color: AppColor.errorColor,
                        size: 14,
                      ),
                      horizontalSpaceTiny,
                      Text(
                        "4h 10min",
                        style: tinyTextStyle,
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
