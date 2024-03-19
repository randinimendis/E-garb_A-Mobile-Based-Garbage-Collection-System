import 'package:chauffuer/data/models/responses/otp_response.dart';
import 'package:chauffuer/data/providers/login_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../data/storage/secure_storage.dart';

class OTPViewModel extends GetxController {
  final LoginProvider provider;
  OTPViewModel({required this.provider});
  var phone = "";
  var otp = "";

  bool validateForm({required GlobalKey<FormState> key}) {
    final isValid = key.currentState?.validate();
    if (isValid == null) return false;

    if (isValid) {
      key.currentState?.save();
      return true;
    }
    return false;
  }

  void loginWithOtp(
    Function(OtpResponse? otpResponse, String? error) completionHandler,
  ) {
    provider.loginWithOtp(phone, otp).then((response) {
      if (response.statusCode == 200) {
        OtpResponse responseData = otpResponseFromJson(response.data!);
        completionHandler(responseData, null);
      }
    }, onError: (error) {
      completionHandler(null, error.toString());
      return;
    });
  }
}
