import 'package:chauffuer/theme/app_colors.dart';
import 'package:flutter/material.dart';

class ProfileTile extends StatelessWidget {
  final String assetPath;

  ProfileTile({required this.assetPath});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 380.0,
        height: 180.0,
        child: Image.asset(
          assetPath,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
