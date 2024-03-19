import 'package:chauffuer/modules/map/map_controller.dart';
import 'package:chauffuer/modules/map/map_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class MapBinding extends Bindings {
  @override
  void dependencies() {
    // Get.lazyPut(() => MapProvider());
    Get.lazyPut(() => MapViewModel());
    Get.lazyPut(() => TextEditingController());
    Get.lazyPut<MapController>(() => MapController(viewModel: Get.find()));
  }
}
