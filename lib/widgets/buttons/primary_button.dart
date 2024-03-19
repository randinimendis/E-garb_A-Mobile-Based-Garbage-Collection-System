import 'package:chauffuer/theme/app_theme.dart';
import 'package:flutter/material.dart';

import '../../theme/app_colors.dart';


class PrimaryButton extends StatefulWidget {
  final String title;
  final Function()? onPressed;
  final double height;
  final double fontSize;
  final Color? color;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final double? borderRadius;
  final FontWeight? fontWeight;
  PrimaryButton({
    super.key,
    required this.title,
    this.onPressed,
    this.height = 50.0,
    this.fontSize = 15.0,
    this.color,
    backgroundColor,
    foregroundColor,
    this.borderRadius,
    this.fontWeight,
  })  : backgroundColor = backgroundColor ?? AppColors.primaryButtonColor,
        foregroundColor =
            foregroundColor ?? AppColors.primaryButtonTextColor;
  @override
  _PrimaryButtonState createState() => _PrimaryButtonState();
}
class _PrimaryButtonState extends State<PrimaryButton> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            child: Text(
              widget.title,
              style: TextStyle(
                color: widget.color,
                fontSize: widget.fontSize,
                fontFamily: AppTheme.primaryFont,
                fontWeight: widget.fontWeight ?? FontWeight.w700,
              ),
            ),
            style: ElevatedButton.styleFrom(
              minimumSize: Size(0, widget.height),
              backgroundColor: widget.backgroundColor,
              foregroundColor: widget.foregroundColor,
              shadowColor: Colors.transparent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(widget.borderRadius ?? 8),
              ),
            ),
            onPressed: widget.onPressed,
          ),
        ),
      ],
    );
  }
}