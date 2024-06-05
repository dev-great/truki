import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:trucki/app/shared/app_decoration.dart';
import 'package:trucki/app/styels/ui_helper.dart';
import 'package:trucki/core/constant/app_colors.dart';
import 'package:trucki/core/constant/ui_helper.dart';
import 'package:trucki/features/orders/presentation/pages/order_detail_screen.dart';
import 'package:trucki/features/widgets/order_card.dart';

class OrderScreen extends StatefulWidget {
  static const String route = '/order';
  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  Future init() async {
    _tabController = TabController(
      length: 3,
      vsync: this,
    );
  }

  @override
  void initState() {
    init();
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  int isSelected = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100.0),
        child: AppBar(
          backgroundColor: AppColor.whiteColor,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Iconsax.arrow_left_copy,
            ),
          ),
          title: const Text("Orders", style: bodyTextStyle),
          toolbarHeight: kToolbarHeight + 50,
          elevation: 0,
          centerTitle: true,
          actions: const [],
        ),
      ),
      body: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: DefaultTabController(
          length: 2,
          child: Scaffold(
            body: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                children: [
                  gapSmall,
                  Container(
                    height: 42,
                    width: screenWidth(context, 1.1),
                    decoration: BoxDecoration(
                        color: AppColor.text3Color.withOpacity(0.3),
                        border: Border.all(
                          color: AppColor.text3Color.withOpacity(0.3),
                        )),
                    child: TabBar(
                      indicatorWeight: 0.0,
                      controller: _tabController,
                      labelStyle: bodyTextStyle,
                      onTap: (index) {
                        setState(() {
                          isSelected = index;
                        });
                      },
                      tabs: [
                        Tab(
                            child: Text(
                          'Pending',
                          style: bodyTextStyle.copyWith(
                            color: isSelected == 0
                                ? AppColor.whiteColor
                                : AppColor.textColor2,
                          ),
                        )),
                        Tab(
                          child: Text(
                            'Accepted',
                            style: bodyTextStyle.copyWith(
                              color: isSelected == 1
                                  ? AppColor.whiteColor
                                  : AppColor.textColor2,
                            ),
                          ),
                        ),
                        Tab(
                            child: Text(
                          'Completed',
                          style: bodyTextStyle.copyWith(
                            color: isSelected == 2
                                ? AppColor.whiteColor
                                : AppColor.textColor2,
                          ),
                        )),
                      ],
                      indicatorSize: TabBarIndicatorSize.tab,
                      indicator: BoxDecoration(
                        color: AppColor.primaryColor,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: AppColor.primaryColor),
                      ),
                    ),
                  ),
                  gapSmall,
                  Row(
                    children: [
                      Text(
                        "Today",
                        style: bodyTextStyle,
                      ),
                    ],
                  ),
                  gapSmall,
                  Flexible(
                    child: TabBarView(
                      physics: const NeverScrollableScrollPhysics(),
                      controller: _tabController,
                      children: [
                        ListView.builder(
                          itemCount: 6,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, OrderDetailsScreen.route);
                              },
                              child: const OrderCard(),
                            );
                          },
                        ),
                        ListView.builder(
                          itemCount: 6,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, OrderDetailsScreen.route);
                              },
                              child: const OrderCard(),
                            );
                          },
                        ),
                        ListView.builder(
                          itemCount: 6,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, OrderDetailsScreen.route);
                              },
                              child: const OrderCard(),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
