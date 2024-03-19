import 'package:chauffuer/data/providers/login_provider.dart';
import 'package:chauffuer/modules/otp/otp_view_model.dart';
import 'package:get/get.dart';

import 'otp_controller.dart';

class OTPBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginProvider());
    Get.lazyPut(() => OTPViewModel(provider: Get.find()));
    Get.lazyPut<OTPController>(() => OTPController(viewModel: Get.find()));

  }
}
