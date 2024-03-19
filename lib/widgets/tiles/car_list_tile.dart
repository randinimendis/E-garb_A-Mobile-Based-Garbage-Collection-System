import 'package:flutter/material.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_theme.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CarListTile extends StatelessWidget {
  final String assetPath;
  final String name;
  final String vehicleNumber;
  final String seatingCapacity;
  final String costPerDay;

  final _isLoading = false;

  bool get isLoading => _isLoading;

  CarListTile(
      {required this.assetPath,
      required this.name,
      required this.vehicleNumber,
      required this.seatingCapacity,
      required this.costPerDay});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: false,
      child: Card(
        color: AppColors.primaryBackgroundColor,
        elevation: 5.0,
        margin: EdgeInsets.all(8.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
        ),
        child: Column(
          children: [
            Container(
              width: 300,
              child: AspectRatio(
                aspectRatio: 19 / 9.5,
                child: Image.asset(
                  assetPath,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 295.0),
              child: Text(
                this.name,
                style: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                  //color: AppColors.TextColor,
                ),
              ),
            ),
            SizedBox(height: 13.0),
            Padding(
              padding: const EdgeInsets.only(right: 230.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  for (var category in categories)
                    Column(
                      children: [
                        Row(
                          children: [
                            Icon(category.icon, color: AppColors.iconsColor),
                            SizedBox(width: 8.0),
                            Text(
                              category.label,
                              style: TextStyle(
                                color: AppColors.textColor,
                                fontSize: 15,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w500,
                                height: 0,
                                letterSpacing: 0.24,
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: 8.0),
                      ],
                    ),
                ],
              ),
            ),
            Container(
              height: 70.0,
              decoration: BoxDecoration(
                color: AppColors.carTitle,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10.0),
                  bottomRight: Radius.circular(10.0),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Column(
                      children: [
                        Text(
                          this.vehicleNumber,
                          style: AppTheme.vehicleTileText,
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          this.seatingCapacity,
                          style: AppTheme.vehicleTileText,
                        ),
                      ],
                    ), //and fix
                    SizedBox(
                      width: 130.0,
                    ),
                    Column(
                      children: [
                        Text(
                          'Day/',
                          style: AppTheme.vehicleTileText,
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          this.costPerDay,
                          style: TextStyle(
                            color: AppColors.iconsColor,
                            fontSize: 15,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w600,
                            letterSpacing: 0.32,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Category {
  final IconData icon;
  final String label;

  Category({
    required this.icon,
    required this.label,
  });
}

List<Category> categories = [
  Category(icon: Icons.people, label: '5'),
  Category(icon: Icons.card_giftcard, label: '4'),
  Category(icon: Icons.location_pin, label: '6'),
];
