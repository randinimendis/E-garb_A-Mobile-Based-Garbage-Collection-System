import 'package:chauffuer/routes/app_routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../data/models/requests/signup_reuest.dart';
import '../../data/providers/signup_provider.dart';
import '../../data/storage/secure_storage.dart';
import '../../utilities/constants/message_constants.dart';

class SignUpViewModel {
  final SignUpProvider provider;
  SignUpViewModel({required this.provider});
  var firstName = "";
  var lastName = "";
  var phone = "";
  var email = "";
  var password = "";

  String? validateName(String? name) {
    if (name == null || name.isEmpty) {
      return MessageConstants.validationEmptyName;
    }

    return null;
  }

  String? validatePhone(String? phone) {
    if (phone == null || phone.isEmpty) {
      return MessageConstants.validationEmptyPhoneNumber;
    }

    return null;
  }

  String? validateEmail(String? email) {
    if (email == null || email.isEmpty) {
      return MessageConstants.validationEmptyEmail;
    }
    if (!GetUtils.isEmail(email)) {
      return MessageConstants.validationInValidEmail;
    }
    return null;
  }

  String? validatePassword(String? password) {
    if (password == null || password.isEmpty) {
      return MessageConstants.validationEmptyPassword;
    }
    return null;
  }

  void signup() {
    //login logic
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

  void signUpUser(
    Function(bool isSuccess, String? error) completionHandler,
  ) {
    SignUpRequest signUpRequest = SignUpRequest(
      password: password,
      phoneNumber: phone,
      firstName: firstName,
      lastName: lastName,
      email: email,
    );
    // final token = SecureStorage.shared.token ?? '';
    // final userId = SecureStorage.shared.user?.id.toString() ?? '';
    provider.signUpUser(signUpRequest).then((response) {
      if (response) {
        Get.toNamed(AppRoutes.login);
      }
      completionHandler(true, null);
    }, onError: (error) {
      completionHandler(false, error.toString());
      return;
    });
  }
}
