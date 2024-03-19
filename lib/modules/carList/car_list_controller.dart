import 'package:chauffuer/data/models/responses/vehicle_list_response.dart';
import 'package:chauffuer/modules/carList/car_list_view_model.dart';
import 'package:get/get.dart';

import '../../data/storage/secure_storage.dart';

class CarListController extends GetxController {
  final CarListViewModel viewModel;

  CarListController({required this.viewModel});

  late List<VehicleList> viewVehicleList=[];
  final secureStorage=SecureStorage.shared;
  @override
  void onInit() {
    super.onInit();
    final token = SecureStorage.shared.token ?? '';
    print(token);
    viewModel.getVehicleList(token,(vehicleList, error) => viewVehicleList=vehicleList);
  }
}
