import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../routes/app_routes.dart';
import '../../utilities/enums.dart';
import '../../utilities/helpers/massage_helper.dart';

class BookingController extends GetxController {
  Rx<DateTime?> startDate = Rx<DateTime?>(null);
  Rx<DateTime?> endDate = Rx<DateTime?>(null);
  Rx<TimeOfDay?> startTime = Rx<TimeOfDay?>(null);
  Rx<TimeOfDay?> endTime = Rx<TimeOfDay?>(null);
  RxMap selectedAmenities = {}.obs;

  final _isLoading = false.obs;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Future<void> selectDate(BuildContext context, bool isStartDate) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2030),
    );

    if (pickedDate != null) {
      if (isStartDate) {
        pickStartDate(pickedDate);
      } else {
        pickEndDate(pickedDate);
      }
    }
  }

  Future<void> selectTime(BuildContext context, bool isStartTime) async {
    TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (pickedTime != null) {
      if (isStartTime) {
        pickStartTime(pickedTime);
      } else {
        pickEndTime(pickedTime);
      }
    }
  }

  void onBookingButtonPressed() {
    final isValid = formKey.currentState!.validate();
    if (isValid) {
      formKey.currentState?.save();
      _isLoading.value = true;
      MessageHelper.snackBar(
          MessageType.success, "Success", "Booking is Successfully!");
      _isLoading.value = false;
      Get.toNamed(AppRoutes.booking);
    }
  }

  void pickStartDate(DateTime date) {
    startDate.value = date;
  }

  void pickEndDate(DateTime date) {
    endDate.value = date;
  }

  void pickStartTime(TimeOfDay time) {
    startTime.value = time;
  }

  void pickEndTime(TimeOfDay time) {
    endTime.value = time;
  }

  void addAmenity(String amenity) {
    if (selectedAmenities.containsKey(amenity)) {
      selectedAmenities[amenity] = selectedAmenities[amenity]! + 1;
    } else {
      selectedAmenities[amenity] = 1;
    }
  }

  void removeAmenity(String amenity) {
    if (selectedAmenities.containsKey(amenity)) {
      if (selectedAmenities[amenity]! > 1) {
        selectedAmenities[amenity] = selectedAmenities[amenity]! - 1;
      } else {
        selectedAmenities.remove(amenity);
      }
    }
  }
}
