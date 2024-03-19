import 'package:get/get.dart';
import 'driverDetails_controller.dart';

class DriverDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DriverDetailsController());
  }
}
