import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:get/get.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_theme.dart';
import '../../widgets/buttons/primary_button.dart';
import 'map_controller.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

class MapView extends GetView<MapController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Obx(() {
            return Padding(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).size.height * 0.23),
              child: GoogleMap(
                mapType: MapType.normal,
                initialCameraPosition: CameraPosition(
                  target: controller.currentPosition.value ??
                      LatLng(37.42796133580664, -122.085749655962),
                  zoom: 17,
                ),
                onMapCreated: (GoogleMapController controllerData) {
                  controller.mapController.complete(controllerData);
                },
                markers: {
                  if (controller.currentPosition.value != null)
                    Marker(
                      markerId: MarkerId("currentPosition"),
                      position: controller.currentPosition.value!,
                      infoWindow: InfoWindow(title: "Current Position"),
                    ),
                  if (controller.destinationPosition.value != null)
                    Marker(
                      markerId: MarkerId("destinationPosition"),
                      position: controller.destinationPosition.value!,
                      infoWindow: InfoWindow(title: "Destination"),
                    ),
                },
              ),
            );
          }),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 50.0, left: 15.0),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColors.primaryBackgroundColor,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: IconButton(
                      icon: Icon(
                        (CupertinoIcons.back),
                      ),
                      onPressed: () => Get.back(),
                    ),
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    color: AppColors.primaryBackgroundColor,
                    borderRadius: BorderRadius.circular(43)),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.width * 0.8,
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        SizedBox(width: 16.0),
                        Text(
                          'Pickup Location',
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                            fontFamily: AppTheme.primaryFont,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8.0),
                    TypeAheadField(
                      builder: (context, controller, focusNode) {
                        return TextField(
                          controller: controller,
                          focusNode: focusNode,
                          autofocus: true,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.my_location),
                            hintText: 'Enter pickup location',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                          ),
                        );
                      },
                      suggestionsCallback: (pattern) async {
                        // Instead of hardcoding dummy data, consider using a separate function:
                        return await fetchDummyPickupSuggestions(pattern);
                      },
                      itemBuilder: (context, suggestion) {
                        return ListTile(
                          title: Text(suggestion['name']!),
                        );
                      },
                      onSelected: (suggestion) {
                        controller.setCurrentPickupLocation(suggestion);
                      },
                    ),
                    SizedBox(height: 16.0),
                    Row(
                      children: [
                        SizedBox(width: 16.0),
                        Text(
                          'Drop Location',
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                            fontFamily: AppTheme.primaryFont,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8.0),
                    TypeAheadField(
                      builder: (context, controller, focusNode) {
                        return TextField(
                            controller: controller,
                            focusNode: focusNode,
                            autofocus: true,
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.location_pin),
                              hintText: 'Enter drop location',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                            ));
                      },
                      suggestionsCallback: (pattern) async {
                        return await controller.fetchDropSuggestions(pattern);
                      },
                      itemBuilder: (context, suggestion) {
                        return ListTile(
                          title: Text(suggestion['name']),
                        );
                      },
                      onSelected: (suggestion) {
                        controller.setCurrentDropLocation(suggestion);
                      },
                    ),
                    SizedBox(height: 28.0),
                    PrimaryButton(
                      onPressed: controller.FindButtonPressed,
                      backgroundColor: AppColors.buttonsColor,
                      title: "Find my ride",
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Future<List<Map<String, String>>> fetchDummyPickupSuggestions(
      String pattern) async {
    await Future.delayed(Duration(milliseconds: 500));

    List<Map<String, String>> suggestions = [
      {'name': '123 Main Street, Anytown, CA'},
      {'name': '456 Elm Street, Springfield, MA'},
      {'name': '789 Oak Avenue, Seattle, WA'},
    ];

    if (pattern.isNotEmpty) {
      suggestions = suggestions
          .where((suggestion) =>
              suggestion['name']!.toLowerCase().contains(pattern.toLowerCase()))
          .toList();
    }

    return suggestions;
  }
}
