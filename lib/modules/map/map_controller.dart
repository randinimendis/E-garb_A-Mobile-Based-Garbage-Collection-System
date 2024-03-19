import 'dart:async';

import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../utilities/enums.dart';
import '../../utilities/helpers/massage_helper.dart';
import 'map_view_model.dart';

class MapController extends GetxController {
  Rx<LatLng> currentPosition = Rx<LatLng>(LatLng(7.311631, 80.634272));
  Rx<LatLng?> destinationPosition = Rx<LatLng?>(null);
  final Completer<GoogleMapController> mapController =
  Completer<GoogleMapController>();
  final MapViewModel viewModel;

  MapController({required this.viewModel});

  final _shouldValidate = false.obs;
  final _isLoading = false.obs;

  void FindButtonPressed() {
    _shouldValidate.value = true;
    _isLoading.value = true;
    viewModel.User((isSuccess, message) {
      if (!isSuccess && message != null) {
        MessageHelper.snackBar(MessageType.error, "Error", message);
        _isLoading.value = false;
      } else {
        MessageHelper.snackBar(
            MessageType.success, "Success", message ?? "wait Find your ride!");
        _isLoading.value = false;
      }
    });
  }

  Future<List<Map<String, dynamic>>> fetchPickupSuggestions(
      String pattern) async {
    final response = await http.get(Uri.parse('$pattern'));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((e) => e as Map<String, dynamic>).toList();
    } else {
      throw Exception('Failed to fetch pickup');
    }
  }

  Future<List<Map<String, dynamic>>> fetchDropSuggestions(
      String pattern) async {
    final response = await http.get(Uri.parse('$pattern'));
    //Uri.parse('https://api.example.com/drop-locations?query=$pattern'));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((e) => e as Map<String, dynamic>).toList();
    } else {
      throw Exception('Failed to fetch drop');
    }
  }

  void setCurrentPickupLocation(Map<String, dynamic> locationData) {
    final double latitude = locationData['latitude'];
    final double longitude = locationData['longitude'];
    currentPosition.value = LatLng(latitude, longitude);
  }

  void setCurrentDropLocation(Map<String, dynamic> locationData) {
    final double latitude = locationData['latitude'];
    final double longitude = locationData['longitude'];
    destinationPosition.value = LatLng(latitude, longitude);
  }
}
