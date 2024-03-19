import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../theme/app_colors.dart';
import '../../widgets/tiles/car_details_tile.dart';
import '../../widgets/tiles/profile_tile.dart';
import 'driverDetails_controller.dart';

class DriverView extends GetView<DriverDetailsController> {
  const DriverView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        canvasColor: AppColors.textColor,
      ),
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(CupertinoIcons.back),
            onPressed: () => Get.back(),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Text(
                  'Driver Details',
                  style: TextStyle(
                    color: AppColors.textColor,
                    fontSize: 28,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.64,
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: AppColors.primaryBackgroundColor,
                  borderRadius: BorderRadius.circular(43),
                ),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.width * 0.8,
                child: ProfileTile(assetPath: 'assets/images/profile.png'),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Text(
                  'Wattaladeniya',
                  style: TextStyle(
                    color: AppColors.textColor,
                    fontSize: 15,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.32,
                  ),
                ),
              ),
              SizedBox(height: 60.0),
              Padding(
                padding: const EdgeInsets.only(right: 280.0),
                child: Text(
                  'Specifications',
                  style: TextStyle(
                    color: AppColors.textColor,
                    fontSize: 18,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.36,
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: SizedBox(
                  height: 80,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 6,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Container(
                          width: 77.0,
                          height: 80.0,
                          decoration: ShapeDecoration(
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                width: 2,
                                color: AppColors.lightGray,
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              SizedBox(height: 25.0),
              Padding(
                padding: const EdgeInsets.only(right: 295.0),
                child: Text(
                  'Car Features',
                  style: TextStyle(
                    color: AppColors.textColor,
                    fontSize: 18,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.36,
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 50.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.people,
                              color: AppColors.iconsColor,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              '2 Passengers',
                              style: TextStyle(
                                color: AppColors.textColor,
                                fontSize: 15,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w500,
                                letterSpacing: 0.24,
                              ),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.card_giftcard,
                              color: AppColors.iconsColor,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              '2 Passengers',
                              style: TextStyle(
                                color: AppColors.textColor,
                                fontSize: 15,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w500,
                                letterSpacing: 0.24,
                              ),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.location_pin,
                              color: AppColors.iconsColor,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              '2 Passengers',
                              style: TextStyle(
                                color: AppColors.textColor,
                                fontSize: 15,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w500,
                                letterSpacing: 0.24,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.ac_unit,
                              color: AppColors.iconsColor,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              '2 Passengers',
                              style: TextStyle(
                                color: AppColors.textColor,
                                fontSize: 15,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w500,
                                letterSpacing: 0.24,
                              ),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.accessibility,
                              color: AppColors.iconsColor,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              '2 Passengers',
                              style: TextStyle(
                                color: AppColors.textColor,
                                fontSize: 15,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w500,
                                letterSpacing: 0.24,
                              ),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.add_box_sharp,
                              color: AppColors.iconsColor,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              '2 Passengers',
                              style: TextStyle(
                                color: AppColors.textColor,
                                fontSize: 15,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w500,
                                letterSpacing: 0.24,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 100.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
