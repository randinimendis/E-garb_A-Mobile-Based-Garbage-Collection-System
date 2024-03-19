import 'package:flutter/material.dart';

class CarDetailsTile extends StatelessWidget {
  final String assetPath;

  CarDetailsTile({required this.assetPath});

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
