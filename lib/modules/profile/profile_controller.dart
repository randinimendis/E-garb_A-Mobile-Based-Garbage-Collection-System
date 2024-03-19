import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../data/models/responses/profile_response.dart';
import '../../modules/profile/profile_view_model.dart';
import '../../routes/app_routes.dart';
import '../../utilities/enums.dart';
import '../../utilities/helpers/massage_helper.dart';

class ProfileDetailsController extends GetxController {
  final ProfileDetailsViewModel viewModel;

  final _isLoading = false.obs;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late TextEditingController firstName,
      lastName,
      gender,
      address,
      phoneNumber,
      email;

  ProfileDetailsController({
    required this.viewModel,
  });

  late Profile userProfile;

  bool get isLoading => _isLoading.value;

  @override
  void onInit() {
    super.onInit();
    firstName = TextEditingController();
    lastName = TextEditingController();
    gender = TextEditingController();
    address = TextEditingController();
    phoneNumber = TextEditingController();
    email = TextEditingController();

    getUserProfile();
  }

  void onLogoutButtonPressed() {
    final isValid = formKey.currentState!.validate();
    if (isValid) {
      formKey.currentState?.save();
      _isLoading.value = true;
      MessageHelper.snackBar(
          MessageType.success, "Success", "Logout is Successfully!");
      _isLoading.value = false;
      Get.toNamed(AppRoutes.login);
    }
  }

  void getUserProfile() async {
    _isLoading.value = true;
    try {
      userProfile = await viewModel.getProfile();
      firstName.text = userProfile.firstName!;
      lastName.text = userProfile.lastName!;
      gender.text = userProfile.gender == 0 ? "Male" : "Female";
      address.text = userProfile.address!;
      phoneNumber.text = userProfile.phoneNumber!;
      email.text = userProfile.email!;
    } catch (e, stack) {
      print(e);
      print(stack);
    }

    _isLoading.value = false;
  }

  void updateUserProfile() async {
    _isLoading.value = true;
    try {
      userProfile.firstName = firstName.text;
      userProfile.lastName = lastName.text;
      userProfile.gender = gender.text == "Male" ? 0 : 1;
      userProfile.address = address.text;
      userProfile.phoneNumber = phoneNumber.text;
      userProfile.email = email.text;
      MessageHelper.snackBar(
          MessageType.success, "Success", "Profile updated successfully!");

      _isLoading.value = false;
    } catch (e, stack) {
      print(e);
      print(stack);
      _isLoading.value = false;
    }
  }
}
