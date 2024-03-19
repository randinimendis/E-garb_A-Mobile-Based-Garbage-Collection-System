import 'package:chauffuer/modules/profile/profile_controller.dart';
import 'package:chauffuer/modules/profile/profile_view_model.dart';
import 'package:get/get.dart';

import '../../data/providers/profile_provider.dart';

class ProfileDetailsBinding extends Bindings {
  @override
  void dependencies() {
      Get.lazyPut(() => ProfileProvider());
      Get.lazyPut(() => ProfileDetailsViewModel(provider: Get.find()));
      Get.lazyPut<ProfileDetailsController>(() => ProfileDetailsController(viewModel: Get.find()));

    }
  }

