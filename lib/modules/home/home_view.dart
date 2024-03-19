import 'package:chauffuer/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../widgets/tiles/car_tile.dart';
import '../../widgets/tiles/logo_tile.dart';
import 'home_controller.dart';

class HomeView extends StatelessWidget {
  final HomeController homeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        canvasColor: AppColors.textColor,
      ),
      child: Scaffold(
        appBar: _buildAppBar(),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeaderSection(),
              Container(
                decoration: BoxDecoration(
                    color: AppColors.primaryBackgroundColorBorders,
                    borderRadius: BorderRadius.circular(40)),
                child: Column(
                  children: [
                    _buildSearchBarSection(),
                    _buildLogoSection(),
                    SizedBox(height: 50),
                    _buildCarsSection(),
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: _buildBottomNavigationBar(),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      actions: [
        IconButton(
          icon: Icon(Icons.person),
          onPressed: () {
            // Handle user profile icon tap
          },
        ),
      ],
    );
  }

  Widget _buildHeaderSection() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 308,
        height: 109,
        child: Text(
          'Find your favorite \nvehicle.',
          style: TextStyle(
            color: AppColors.textColor,
            fontSize: 32,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w400,
            height: 0,
            letterSpacing: 0.64,
          ),
          textAlign: TextAlign.left,
        ),
      ),
    );
  }

  Widget _buildSearchBarSection() {
    return Container(
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
    );
  }

  Widget _buildLogoSection() {
    return Container(
      height: 120,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 360.0),
            child: Text(
              'See All',
              style: TextStyle(
                color: AppColors.textColor,
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 10),
          Container(
            height: 80,
            child: ListView(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              children: [
                GestureDetector(
                  onTap: () {
                    Get.toNamed('/car-list');
                  },
                  child:
                      LogoTile(assetPath: 'assets/logos/ic_bentley_black.png'),),
                LogoTile(assetPath: 'assets/logos/ic_audi_black.png'),
                LogoTile(assetPath: 'assets/logos/ic_Benz_black.png'),
                LogoTile(assetPath: 'assets/logos/ic_bmw_black.png'),
                LogoTile(assetPath: 'assets/logos/ic_tesla_black.png'),
                LogoTile(assetPath: 'assets/logos/ic_daihatsu_black.png'),
                LogoTile(assetPath: 'assets/logos/ic_mitsubishi_black.png'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCarsSection() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 360.0),
            child: Text(
              'See All',
              style: TextStyle(
                color: AppColors.textColor,
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 15.0),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 300.0,
              child: ListView(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                children: [
                  CarTile(assetPath: 'assets/cars/car_2.png'),
                  CarTile(assetPath: 'assets/cars/car_1.png'),
                  CarTile(assetPath: 'assets/cars/car_3.png'),
                  CarTile(assetPath: 'assets/cars/car_2.png'),
                ],
              ),
            ),
          ),
        ],
      ),
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
