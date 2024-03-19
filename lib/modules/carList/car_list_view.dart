import 'package:chauffuer/modules/carList/car_list_controller.dart';
import 'package:chauffuer/widgets/tiles/car_list_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CarListView extends GetView<CarListController> {
  const CarListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(CupertinoIcons.back),
          onPressed: () => Get.back(),
        ),
      ),
      body: Column(
        children: [
          Text(
            'All Available',
            style: TextStyle(
              fontSize: 28,
              fontFamily: 'Inter',
              fontWeight: FontWeight.bold,
              height: 0,
              letterSpacing: 0.64,
            ),
          ),
          Container(
            padding: EdgeInsets.all(30),
            child: SearchAnchor(
              builder: (BuildContext context, SearchController controller) {
                return SearchBar(
                  controller: controller,
                  padding: const MaterialStatePropertyAll<EdgeInsets>(
                      EdgeInsets.symmetric(horizontal: 16.0)),
                  onTap: () {
                    controller.openView();
                  },
                  onChanged: (_) {
                    controller.openView();
                  },
                  leading: const Icon(Icons.search),
                  trailing: <Widget>[],
                );
              },
              suggestionsBuilder:
                  (BuildContext context, SearchController controller) {
                return List<ListTile>.generate(5, (int index) {
                  final String item = 'cars $index';
                  return ListTile(
                    title: Text(item),
                    onTap: () {
                      controller.closeView(item);
                    },
                  );
                });
              },
            ),
          ),
          SizedBox(height: 10.0),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: 550.0,
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: controller.viewVehicleList.length,
                itemBuilder: (context, index) {
                  return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () {
                          Get.toNamed('/car-details');
                        },
                        child: CarListTile(
                          assetPath: 'assets/cars/car_2.png',
                          name: controller.viewVehicleList[index].name!,
                          vehicleNumber:
                              controller.viewVehicleList[index].vehicleNumber!,
                          seatingCapacity: controller
                              .viewVehicleList[index].seatingCapacity
                              .toString(),
                          costPerDay: controller
                              .viewVehicleList[index].costPerDay
                              .toString(),
                        ),
                      ));
                },
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildBottomNavigationBar() {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: "",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.notifications_active),
          label: "",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.location_pin),
          label: "",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: "",
        ),
      ],
    );
  }
}
