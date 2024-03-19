import 'package:chauffuer/data/providers/signup_provider.dart';
import 'package:chauffuer/modules/signUp/signup_controller.dart';
import 'package:chauffuer/modules/signUp/signup_view_model.dart';
import 'package:get/get.dart';

class SignupBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SignUpProvider());
    Get.lazyPut(() => SignUpViewModel(provider: Get.find()));
    Get.lazyPut<SignupController>(
        () => SignupController(viewModel: Get.find()));
  }
}
