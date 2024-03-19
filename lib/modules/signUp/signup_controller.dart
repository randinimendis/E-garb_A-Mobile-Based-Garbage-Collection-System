import 'dart:io' if (dart.library.ffi) 'dart:ffi';
import 'package:chauffuer/modules/signUp/signup_view_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/storage/user_defaults.dart';
import '../../routes/app_routes.dart';
import '../../utilities/enums.dart';
import '../../utilities/helpers/massage_helper.dart';

class SignupController extends GetxController {
  final SignUpViewModel viewModel;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late TextEditingController EmailController,
      PasswordController,
      FirstNameController,
      LastNameController,
      phoneController;

  final _isLoading = false.obs;
  final _isPasswordHidden = true.obs;
  final _emailValidationMessage = ''.obs;
  final _phoneValidationMassage = ''.obs;
  final _nameValidationMassage = ''.obs;
  final _passwordValidationMessage = ''.obs;
  final _loginErrorMessage = ''.obs;
  final _shouldValidate = false.obs;

  //Getter Setters
  bool get isLoading => _isLoading.value;
  String get loginErrorMessage => _loginErrorMessage.value;
  RxString get nameValidationMassage => _nameValidationMassage;
  RxString get phoneValidationMassage => _phoneValidationMassage;
  RxBool get isPasswordHidden => _isPasswordHidden;
  RxString get emailValidationMessage => _emailValidationMessage;
  RxString get passwordValidationMessage => _passwordValidationMessage;

  IconData get passwordSuffixIcon {
    return _isPasswordHidden.value
        ? Icons.visibility_off_outlined
        : Icons.visibility_outlined;
  }

  SignupController({required this.viewModel});

  @override
  void onInit() {
    super.onInit();
    FirstNameController = TextEditingController();
    LastNameController = TextEditingController();
    phoneController = TextEditingController();
    EmailController = TextEditingController();
    PasswordController = TextEditingController();

    if (kDebugMode) {
      FirstNameController.text = 'Ashen';
      LastNameController.text = 'Madhusnaka';
      EmailController.text = 'akilafdo20019@gmail.com';
      phoneController.text = '770068936';
      PasswordController.text = 'Admin@1234';
    }
  }

  @override
  void onClose() {
    FirstNameController.dispose();
    LastNameController.dispose();
    phoneController.dispose();
    EmailController.dispose();
    PasswordController.dispose();
  }

  void onSingUpButtonPressed() {
    _shouldValidate.value = true;
    final isValidForm = viewModel.validateForm(key: formKey);
    if (!isValidForm) return;
    _isLoading.value = true;
    viewModel.signUpUser((isSuccess, message) {
      _isLoading.value = false;
      if (!isSuccess && message != null) {
        MessageHelper.snackBar(MessageType.error, "Error", message);
        _isLoading.value = false;
      } else {
        MessageHelper.snackBar(MessageType.success, "Success",
            message ?? "SignUp in successfully!");
        _isLoading.value = false;
        Get.toNamed(AppRoutes.login);
      }
    });
    FocusManager.instance.primaryFocus?.unfocus();
    _resetFields();
  }

  void SignUpButtonPressed() {
    UserDefaults.shared.isFirstRun = false;
    Get.offNamed(AppRoutes.login);
  }

  void onFirstNameSaved(String? value) {
    viewModel.firstName = value ?? '';
  }

  void onLastNameSaved(String? value) {
    viewModel.lastName = value ?? '';
  }

  void onEmailSaved(String? value) {
    viewModel.email = value ?? '';
  }

  void onPhoneSaved(String? value) {
    viewModel.phone = value ?? '';
  }

  void onPasswordSuffixIconPressed() {
    _isPasswordHidden.toggle();
  }

  String? FirstNameValidator(String? value) {
    final error = viewModel.validateName(value);
    if (error != null) {
      _nameValidationMassage.value = error;
      return '';
    }
    _nameValidationMassage.value = '';
    return null;
  }

  String? LastNameValidator(String? value) {
    final error = viewModel.validateName(value);
    if (error != null) {
      _nameValidationMassage.value = error;
      return '';
    }
    _nameValidationMassage.value = '';
    return null;
  }

  String? phoneValidator(String? value) {
    final error = viewModel.validatePhone(value);
    if (error != null) {
      _phoneValidationMassage.value = error;
      return '';
    }
    _phoneValidationMassage.value = '';
    return null;
  }

  String? emailValidator(String? value) {
    final error = viewModel.validateEmail(value);
    if (error != null) {
      _emailValidationMessage.value = error;
      return '';
    }
    _emailValidationMessage.value = '';
    return null;
  }

  void onPasswordSaved(String? value) {
    viewModel.password = value ?? '';
  }

  String? passwordValidator(String? value) {
    final error = viewModel.validatePassword(value);
    if (error != null) {
      _passwordValidationMessage.value = error;
      return '';
    }
    _passwordValidationMessage.value = '';
    return null;
  }

  void _resetFields() {
    _isPasswordHidden.value = true;
    _loginErrorMessage.value = '';
    FirstNameController.text = '';
    LastNameController.text = '';
    phoneController.text = '';
    EmailController.text = '';
    PasswordController.text = '';
  }
}
