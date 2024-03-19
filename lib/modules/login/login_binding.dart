import 'package:chauffuer/data/providers/login_provider.dart';
import 'package:get/get.dart';
import 'login_controller.dart';
import 'login_view_model.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginProvider());
    Get.lazyPut(() => LoginViewModel(provider: Get.find()));
    Get.lazyPut<LoginController>(() => LoginController(viewModel: Get.find()));
  }
}
