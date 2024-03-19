import 'package:get/get.dart';

import '../../data/providers/vehicle_provider.dart';
import 'car_list_controller.dart';
import 'car_list_view_model.dart';

class CarListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => VehicleListProvider());
    Get.lazyPut(() => CarListViewModel(provider: Get.find()));
    Get.lazyPut<CarListController>(() => CarListController(viewModel: Get.find()));
  }
}
