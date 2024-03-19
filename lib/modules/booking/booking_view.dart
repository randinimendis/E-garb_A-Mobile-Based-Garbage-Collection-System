import 'package:chauffuer/theme/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../theme/app_theme.dart';
import '../../widgets/buttons/primary_button.dart';
import 'booking_controller.dart';

class BookingView extends GetView<BookingController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(CupertinoIcons.back),
          onPressed: () => Get.back(),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(child: Obx(
          () {
            return Column(
              children: [
                Text(
                  'Booking',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    fontFamily: AppTheme.primaryFont,
                  ),
                ),
                SizedBox(height: 50.0),
                Form(
                  key: controller.formKey,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          Row(
                            children: [
                              SizedBox(width: 10),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: SizedBox(
                                  width: 150,
                                  height: 50,
                                  child: ElevatedButton(
                                    onPressed: () =>
                                        controller.selectDate(context, true),
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: AppColors.buttonsColor,
                                    ),
                                    child: Text(
                                      "Start Date",
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: AppColors.white,
                                        fontFamily: AppTheme.primaryFont,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(width: 10),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: SizedBox(
                                  width: 150,
                                  height: 50,
                                  child: ElevatedButton(
                                    onPressed: () =>
                                        controller.selectDate(context, false),
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: AppColors.buttonsColor,
                                    ),
                                    child: Text(
                                      "End Date",
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: AppColors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(width: 10),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: SizedBox(
                    width: 150,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () => controller.selectTime(context, true),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.buttonsColor,
                      ),
                      child: Text(
                        "Pick Time",
                        style: TextStyle(
                          fontSize: 15,
                          color: AppColors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 5.0),
                Container(
                  padding: EdgeInsets.all(16),
                  margin: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Selected Dates:',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: AppColors.primaryColor,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Start Date: ${controller.startDate.value ?? "0000/00/00"}',
                        style: TextStyle(
                          fontSize: 18,
                          color: AppColors.textColor,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        'End Date: ${controller.endDate.value ?? "0000/00/00"}',
                        style: TextStyle(
                          fontSize: 18,
                          color: AppColors.textColor,
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        'Selected Times:',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: AppColors.primaryColor,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Start Time: ${controller.startTime.value ?? "00:00"}',
                        style: TextStyle(
                          fontSize: 18,
                          color: AppColors.textColor,
                        ),
                      ),
                      SizedBox(height: 20),
                    ],
                  ),
                ),
                SizedBox(height: 20.0),
                Text(
                  'Amenities',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    fontFamily: AppTheme.primaryFont,
                  ),
                ),
                SizedBox(height: 10.0),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      amenityCard('Vodka', Icons.local_bar),
                      amenityCard('Chicken Wings', Icons.fastfood_rounded),
                      amenityCard('Coffee', Icons.local_cafe),
                      amenityCard('medicine', Icons.medication),
                    ],
                  ),
                ),
                SizedBox(height: 20.0),
                if (controller.selectedAmenities.isNotEmpty) ...[
                  Text(
                    'Selected Amenities:',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontFamily: AppTheme.primaryFont,
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    padding: EdgeInsets.all(16),
                    margin: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:
                          controller.selectedAmenities.entries.map((entry) {
                        return Row(
                          children: [
                            Text(
                              '${entry.key} x${entry.value}',
                              style: TextStyle(
                                fontSize: 18,
                                color: AppColors.textColor,
                              ),
                            ),
                            SizedBox(width: 10),
                            IconButton(
                              icon: Icon(Icons.remove_circle),
                              onPressed: () {
                                controller.removeAmenity(entry.key);
                              },
                            ),
                          ],
                        );
                      }).toList(),
                    ),
                  ),
                  SizedBox(height: 50.0),
                ],
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: PrimaryButton(
                    onPressed: () {
                      controller.onBookingButtonPressed();
                    },
                    backgroundColor: AppColors.buttonsColor,
                    title: "Book",
                  ),
                )
              ],
            );
          },
        )),
      ),
    );
  }

  Widget amenityCard(String amenityName, IconData iconData) {
    return Card(
      child: ListTile(
        leading: Icon(iconData),
        title: Text(amenityName),
        trailing: IconButton(
          icon: Icon(Icons.add_circle),
          onPressed: () {
            controller.addAmenity(amenityName);
          },
        ),
      ),
    );
  }
}
