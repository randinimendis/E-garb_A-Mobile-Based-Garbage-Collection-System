import 'package:chauffuer/theme/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../theme/app_theme.dart';
import '../../widgets/buttons/primary_button.dart';
import '../../widgets/tiles/car_details_tile.dart';
import 'car_details_controller.dart';

class CarView extends GetView<CarDetailsController> {
  const CarView({Key? key}) : super(key: key);

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
              Text(
                'Car Details',
                style: TextStyle(
                  color: AppColors.textColor,
                  fontSize: 28,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.bold,
                  height: 0,
                  letterSpacing: 0.64,
                ),
              ),
              SizedBox(height: 10),
              CarDetailsTile(assetPath: 'assets/cars/car_3.png'),
              SizedBox(height: 10),
              Center(
                child: Text(
                  "cxdfx",
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
                    height: 0,
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
                                  width: 2, color: AppColors.lightGray),
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
                    height: 0,
                    letterSpacing: 0.36,
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 50.0),
                child: Padding(
                  padding: const EdgeInsets.only(left: 40.0),
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
                                  height: 0,
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
                              SizedBox(
                                height: 50,
                              ),
                              Text(
                                '2 Passengers',
                                style: TextStyle(
                                  color: AppColors.textColor,
                                  fontSize: 15,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w500,
                                  height: 0,
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
                                  height: 0,
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
                                  height: 0,
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
                              SizedBox(
                                height: 50,
                              ),
                              Text(
                                '2 Passengers',
                                style: TextStyle(
                                  color: AppColors.textColor,
                                  fontSize: 15,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w500,
                                  height: 0,
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
                                  height: 0,
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
              ),
              SizedBox(
                height: 100.0,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: PrimaryButton(
                  onPressed: () {
                    controller.onBookingButtonPressed();
                  },
                  backgroundColor: AppColors.buttonsColor,
                  title: "Book",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
