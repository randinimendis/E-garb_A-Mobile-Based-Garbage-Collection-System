import 'package:chauffuer/data/models/responses/vehicle_list_response.dart';
import 'package:chauffuer/data/storage/secure_storage.dart';
import 'package:get/get.dart';

import '../../data/providers/vehicle_provider.dart';

class CarListViewModel extends GetxController {
  final VehicleListProvider provider;
  CarListViewModel({required this.provider});

  Future<void> getVehicleList(String token,
      Function(List<VehicleList> vehicleList, String? error) completionHandler) async {
    try {
      List<VehicleList> responseData = await provider.getVehicleList(token).then(
          (response) => List<VehicleList>.from(response
              .map((vehicleData) => VehicleList.fromJson(vehicleData))));

      print(responseData);
      completionHandler(responseData, null);
    } catch (error) {
      print(error.toString());
      completionHandler([], error.toString());
    }
  }
}
