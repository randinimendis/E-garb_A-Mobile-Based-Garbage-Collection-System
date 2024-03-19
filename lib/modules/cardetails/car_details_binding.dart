import 'package:get/get.dart';

import 'car_details_controller.dart';

class CarDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CarDetailsController());
  }
}
