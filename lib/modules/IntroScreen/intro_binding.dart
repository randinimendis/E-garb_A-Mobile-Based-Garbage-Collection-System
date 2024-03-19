import 'package:get/get.dart';

import 'intro_controller.dart';

class WalkthroughBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WalkthroughController>(() => WalkthroughController());
  }
}
