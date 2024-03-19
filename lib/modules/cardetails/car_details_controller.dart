import 'package:get/get.dart';

import '../../data/storage/user_defaults.dart';
import '../../routes/app_routes.dart';

class CarDetailsController extends GetxController {
  void onBookingButtonPressed() {
    UserDefaults.shared.isFirstRun = false;
    Get.offNamed(AppRoutes.booking);
  }

}
