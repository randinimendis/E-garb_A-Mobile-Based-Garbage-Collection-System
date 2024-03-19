import 'package:get/get.dart';

import '../../data/models/responses/profile_response.dart';
import '../../data/providers/profile_provider.dart';

class ProfileDetailsViewModel extends GetxController {
  final ProfileProvider provider;
  ProfileDetailsViewModel({required this.provider});

  Future<Profile> getProfile() async {
    try {
      final responseData = await provider.getProfile();
      return Profile.fromJson(responseData);
    } catch (error, stack) {
      print(error.toString());
      print(stack);
      throw error.toString();
    }
  }
  Future<Profile> updateProfile() async {
    try {
      final responseData = await provider.updateProfile();
      return Profile.fromJson(responseData);
    } catch (error, stack) {
      print(error.toString());
      print(stack);
      throw error.toString();
    }
  }
}
