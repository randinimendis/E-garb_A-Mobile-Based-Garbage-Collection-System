import 'dart:async';
import 'package:chauffuer/data/storage/secure_storage.dart';
import 'package:chauffuer/data/storage/user_defaults.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../routes/app_routes.dart';
import '../../utilities/enums.dart';
import '../../utilities/helpers/massage_helper.dart';
import 'otp_view_model.dart';

class OTPController extends GetxController {
  final String phoneNumber = Get.arguments;
  final List<TextEditingController> otpCodeControllers =
      List<TextEditingController>.generate(
          6, (index) => TextEditingController(text: ""));
  final OTPViewModel viewModel;
  final RxBool _shouldValidate = false.obs;
  final RxInt _remainingTime = 20.obs;
  final RxBool _isLoading = false.obs;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
final secureStorage=SecureStorage.shared;
  // Getters
  bool get shouldValidate => _shouldValidate.value;

  int get remainingTime => _remainingTime.value;

  bool get isLoading => _isLoading.value;

  OTPController({required this.viewModel});

  @override
  void onInit() {
    viewModel.phone = phoneNumber;
    startTimer();
    super.onInit();
  }

  // Countdown timer
  void startTimer() {
    Timer.periodic(Duration(seconds: 1), (timer) {
      if (_remainingTime.value > 0) {
        _remainingTime.value--;
      } else {
        timer.cancel();
      }
    });
  }

  // Reset the remaining time
  void resetTimer() {
    _remainingTime.value = 20;
    startTimer();
  }

  void onOTPSaved(int? value) {
    if(value==5)for(TextEditingController items in otpCodeControllers){
      viewModel.otp+=items.value.text;
    }
  }

  void onOTPButtonPressed() {
    _shouldValidate.value = true;
    final isValidForm = viewModel.validateForm(key: formKey);
    if (!isValidForm) return;
    _isLoading.value = true;
    viewModel.loginWithOtp((otpResponse, message) {
      if (message==null && otpResponse!=null) {
        MessageHelper.snackBar(
            MessageType.success, "Success", "Login is Successfully!");
        _isLoading.value = false;
        UserDefaults.shared.hasLoggedIn=true;
        secureStorage.setToken(otpResponse.token!);
        Get.toNamed(AppRoutes.map);
      } else {
        MessageHelper.snackBar(
            MessageType.error, "Error", message ?? "Login failed!");
        _isLoading.value = false;
      }
    });
  }
}
