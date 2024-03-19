import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../data/storage/user_defaults.dart';
import '../../routes/app_routes.dart';
import '../../utilities/enums.dart';
import '../../utilities/helpers/massage_helper.dart';
import 'login_view_model.dart';

class LoginController extends GetxController {
  final LoginViewModel viewModel;
  final _LoginPage = [];
  final _currentIndex = 0.obs;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late TextEditingController phoneController, passwordController;

  final _isLoading = false.obs;
  final _isPasswordHidden = true.obs;
  final _phoneValidationMassage = ''.obs;
  final _passwordValidationMessage = ''.obs;
  final _loginErrorMessage = ''.obs;
  final _shouldValidate = false.obs;

  //Getter Setters
  bool get isLoading => _isLoading.value;
  int get currentIndex => _currentIndex.value;
  String get nextButtonText => isLastPage ? "Let's get started" : 'Next';
  String get loginErrorMessage => _loginErrorMessage.value;
  RxBool get isPasswordHidden => _isPasswordHidden;
  RxString get phoneValidationMassage => _phoneValidationMassage;
  RxString get passwordValidationMessage => _passwordValidationMessage;
  bool get shouldValidate => _shouldValidate.value;
  bool get isLastPage => _currentIndex.value == _LoginPage.length - 1;

  IconData get passwordSuffixIcon {
    return _isPasswordHidden.value
        ? Icons.visibility_off_outlined
        : Icons.visibility_outlined;
  }

  LoginController({required this.viewModel});

  @override
  void onInit() {
    super.onInit();

    phoneController = TextEditingController();
    passwordController = TextEditingController();
    if (kDebugMode) {
      phoneController.text = '+94770068936';
      passwordController.text = 'Admin@1234';
    }
  }

  @override
  void onClose() {
    phoneController.dispose();
    passwordController.dispose();
  }

  void onLoginButtonPressed() {
    _shouldValidate.value = true;
    final isValidForm = viewModel.validateForm(key: formKey);
    if (!isValidForm) return;
    _isLoading.value = true;
    viewModel.loginUser((isSuccess, message) {
      if (!isSuccess && message != null) {
        MessageHelper.snackBar(MessageType.error, "Error", message);
        _isLoading.value = false;
      } else {
        MessageHelper.snackBar(MessageType.success, "Success",
            message ?? "Your two factor token has been sent to your email!");
        _isLoading.value = false;
        Get.toNamed(AppRoutes.otp, arguments: viewModel.phone);
      }
    });

    FocusManager.instance.primaryFocus?.unfocus();
    _loginErrorMessage.value = '';
    _resetFields();
  }

  void onSignUpButtonPressed() {
    UserDefaults.shared.isFirstRun = false;
    Get.offNamed(AppRoutes.signUp);
  }

  void onPasswordSuffixIconPressed() {
    _isPasswordHidden.toggle();
  }

  void onPhoneSaved(String? value) {
    viewModel.phone = value ?? '';
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
    phoneController.text = '';
    passwordController.text = '';
    _shouldValidate.value = false;
  }
}
