import 'package:chauffuer/data/models/requests/login_request.dart';
import 'package:chauffuer/data/providers/login_provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utilities/constants/message_constants.dart';

class LoginViewModel {
  final LoginProvider provider;
  LoginViewModel({required this.provider});
  var phone = "";
  var password = "";

  String? validatePhone(String? phone) {
    if (phone == null || phone.isEmpty) {
      return MessageConstants.validationEmptyPhoneNumber;
    }
    if (!GetUtils.isPhoneNumber(phone)) {
      return MessageConstants.validationInValidPhoneNumber;
    }
    return null;
  }

  String? validatePassword(String? password) {
    if (password == null || password.isEmpty) {
      return MessageConstants.validationEmptyPassword;
    }
    return null;
  }

  bool validateForm({required GlobalKey<FormState> key}) {
    final isValid = key.currentState?.validate();
    if (isValid == null) return false;

    if (isValid) {
      key.currentState?.save();
      return true;
    }
    return false;
  }

  void loginUser(
    Function(bool isSuccess, String? error) completionHandler,
  ) {
    LoginRequest loginData = LoginRequest(
      phoneNumber: phone,
      password: password,
    );
    // final token = SecureStorage.shared.token ?? '';
    // final userId = SecureStorage.shared.user?.id.toString() ?? '';
    provider.loginUser(loginData).then((response) {
      if (response.statusCode == 200) {
        completionHandler(true, null);
      }
    }, onError: (error) {
      completionHandler(false, error.toString());
      return;
    });
  }
}
