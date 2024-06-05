import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:trucki/app/shared/app_decoration.dart';
import 'package:trucki/app/styels/ui_helper.dart';
import 'package:trucki/core/constant/app_colors.dart';
import 'package:trucki/core/constant/ui_helper.dart';

class FleetTruckCard extends StatelessWidget {
  const FleetTruckCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 90,
        width: screenWidth(context, 1),
        decoration: BoxDecoration(
          color: AppColor.ashColor,
          borderRadius: BorderRadius.circular(3),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(
                children: [
                  CircleAvatar(
                    backgroundColor: AppColor.sucessColor,
                    radius: 5,
                  ),
                  horizontalSpaceTiny,
                  Text(
                    "In-Progress",
                    style: tinyTextStyle,
                  ),
                ],
              ),
              gapTiny,
              const Row(
                children: [
                  CircleAvatar(
                    radius: 14,
                    backgroundColor: AppColor.text3Color,
                    child: Icon(
                      Iconsax.truck_copy,
                      size: 15,
                      color: AppColor.primaryColor,
                    ),
                  ),
                  horizontalSpaceSmall,
                  Column(
                    children: [
                      Text(
                        "Thundra",
                        style: tinyTextStyle,
                      ),
                      gapTiny,
                      Text(
                        "KJA123",
                        style: tinyTextStyle,
                      ),
                    ],
                  ),
                  Spacer(),
                  Text(
                    "Tire Rotation",
                    style: tinyTextStyle,
                  ),
                ],
              ),
              Text(
                "Due on 27/02/2024",
                style: tinyTextStyle.copyWith(
                  color: AppColor.primaryColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
