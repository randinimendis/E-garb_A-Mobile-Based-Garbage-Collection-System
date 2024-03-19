import 'package:chauffuer/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../theme/app_theme.dart';

class CarTile extends StatelessWidget {
  final String assetPath;

  CarTile({required this.assetPath});

  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap: (){},
      child: Container(
        width: 228.70,
        height: 183.0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image Container
            Container(
              width: 211.70,
              height: 93.68,
              decoration: BoxDecoration(
                color: AppColors.carTitle,
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 2), // changes the shadow position
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image.asset(
                  this.assetPath,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 18.0),
            // Car Title Text
            Text(
              "BENTLEY \nCONTINENTAl GT",
              style: AppTheme.tileHeadingText
            ),
            SizedBox(height: 5.0),
            // Rating and Stars
            Row(
              children: [
                Text(
                  "4.9",
                  style: AppTheme.tileGreenText,
                ),
                SizedBox(width: 5.0),
                RatingBar.builder(
                  itemSize: 20.0,
                  initialRating: 4.5,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemPadding: EdgeInsets.symmetric(horizontal: 0.55),
                  itemBuilder: (context, _) => Icon(
                    Icons.star,
                    color: AppColors.buttonsColor,
                  ),
                  onRatingUpdate: (rating) {
                    print(rating);
                  },
                ),
              ],
            ),
            SizedBox(height: 5.0),
          ],
        ),
      ),
    );
  }
}
