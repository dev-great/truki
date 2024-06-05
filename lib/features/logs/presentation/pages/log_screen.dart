import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:intl/intl.dart';
import 'package:trucki/app/shared/app_buttons.dart';
import 'package:trucki/app/shared/app_date_selector.dart';
import 'package:trucki/app/shared/app_decoration.dart';
import 'package:trucki/app/shared/app_input_text2.dart';
import 'package:trucki/app/styels/ui_helper.dart';
import 'package:trucki/core/constant/app_colors.dart';
import 'package:trucki/core/constant/app_string.dart';
import 'package:trucki/core/constant/ui_helper.dart';
import 'package:trucki/features/widgets/fleet_card.dart';

class LogScreen extends StatefulWidget {
  static const String route = '/log';
  const LogScreen({super.key});

  @override
  State<LogScreen> createState() => _LogScreenState();
}

class _LogScreenState extends State<LogScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  Future init() async {
    _tabController = TabController(
      length: 2,
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

  String dropdownValue = 'One';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(100.0),
          child: AppBar(
            backgroundColor: AppColor.ashColor,
            automaticallyImplyLeading: false,
            title: const Text("Logs", style: subHeaderTextStyle),
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
                            'Repair Cycles',
                            style: bodyTextStyle.copyWith(
                              color: isSelected == 0
                                  ? AppColor.whiteColor
                                  : AppColor.textColor2,
                            ),
                          )),
                          Tab(
                            child: Text(
                              'Repair Cycles',
                              style: bodyTextStyle.copyWith(
                                color: isSelected == 1
                                    ? AppColor.whiteColor
                                    : AppColor.textColor2,
                              ),
                            ),
                          ),
                        ],
                        indicatorSize: TabBarIndicatorSize.tab,
                        indicator: BoxDecoration(
                          color: AppColor.primaryColor,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: AppColor.primaryColor),
                        ),
                      ),
                    ),
                    gapMedium,
                    gapSmall,
                    Flexible(
                      child: TabBarView(
                        physics: const NeverScrollableScrollPhysics(),
                        controller: _tabController,
                        children: [
                          ListView.builder(
                            itemCount: 3,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                  onTap: () {
                                    _viewDriver(context);
                                  },
                                  child: const FleetTruckCard());
                            },
                          ),
                          ListView.builder(
                            itemCount: 3,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return const FleetTruckCard();
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
        ));
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
                          "Repair Cycle Details",
                          style: subHeaderTextStyle,
                        ),
                        gapMedium,
                      ],
                    ),
                    gapMedium,
                    const Row(
                      children: [
                        Text(
                          "Truck",
                          style: bodyTextStyle,
                        ),
                      ],
                    ),
                    gapTiny,
                    const Text(
                      "Thundra - KJA123",
                      style: tinyTextStyle,
                    ),
                    gapSmall,
                    const Row(
                      children: [
                        Text(
                          "Issue",
                          style: bodyTextStyle,
                        ),
                      ],
                    ),
                    gapTiny,
                    const Text(
                      "Brake repair",
                      style: tinyTextStyle,
                    ),
                    gapSmall,
                    const Row(
                      children: [
                        Text(
                          "Status",
                          style: bodyTextStyle,
                        ),
                      ],
                    ),
                    gapTiny,
                    const Text(
                      "In Progress",
                      style: tinyTextStyle,
                    ),
                    gapSmall,
                    const Text(
                      "Issue Date",
                      style: bodyTextStyle,
                    ),
                    gapTiny,
                    const Text(
                      "27/02/2024",
                      style: tinyTextStyle,
                    ),
                    gapSmall,
                    const Text(
                      "Repair Date",
                      style: bodyTextStyle,
                    ),
                    gapTiny,
                    const Text(
                      "27/02/2024",
                      style: tinyTextStyle,
                    ),
                    gapMedium,
                    PrimaryBtn(
                        title: "Edit",
                        onPress: () {
                          Navigator.pop(context);
                          _addDriver(context);
                        })
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
                            "Repair Cycle",
                            style: subHeaderTextStyle,
                          ),
                          gapMedium,
                        ],
                      ),
                      gapMedium,
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
                      gapSmall,
                      const Row(
                        children: [
                          Text(
                            "Issue",
                            style: bodyTextStyle,
                          ),
                        ],
                      ),
                      gapTiny,
                      const CustomInputText2(
                        inputType: TextInputType.name,
                        hint: "E.g. Brake repair",
                      ),
                      gapSmall,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "+ Add more",
                            style: tinyTextStyle.copyWith(
                              decoration: TextDecoration.underline,
                              color: AppColor.primaryColor,
                            ),
                          ),
                        ],
                      ),
                      gapSmall,
                      SizedBox(
                        height: screenHeight(context, 5),
                        width: screenWidth(context, 1.1),
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: 3,
                          itemBuilder: (BuildContext context, int index) {
                            return const Padding(
                              padding: EdgeInsets.all(9.0),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Brake repair",
                                        style: bodyTextStyle,
                                      ),
                                      Icon(
                                        Iconsax.trash,
                                        color: AppColor.errorColor,
                                        size: 15,
                                      ),
                                    ],
                                  ),
                                  Divider(),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                      gapSmall,
                      const Row(
                        children: [
                          Text(
                            "Status",
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
                      gapSmall,
                      const Row(
                        children: [
                          Text(
                            "Issue Date",
                            style: bodyTextStyle,
                          ),
                        ],
                      ),
                      gapTiny,
                      CustomDateRangeFormField(
                        label: "Select Issue Date",
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
                      gapTiny,
                      const Row(
                        children: [
                          Text(
                            "Repair Date",
                            style: bodyTextStyle,
                          ),
                        ],
                      ),
                      gapTiny,
                      CustomDateRangeFormField(
                        label: "Select Repair Date",
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
                      PrimaryBtn(
                        title: AppStrings.submit,
                        onPress: () {},
                      ),
                      gapMedium,
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
