import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_theme.dart';

class NumberFormTextField extends StatelessWidget {
  final TextEditingController controller;
  final Function(String?)? onSaved;
  final String? Function(String?)? validator;
  final Function()? onSuffixIconPressed;
  final Function()? onTapped;
  final double? height;
  final double? width;
  final TextAlign? textAlign;
  final bool isFocused;
  final int? characterLimit;
  final bool isReadOnly;
  final Function(String?)? onChanged;

  const NumberFormTextField({
    Key? key,
    required this.controller,
    this.onSaved,
    this.validator,
    this.onSuffixIconPressed,
    this.onTapped,
    this.height,
    this.width,
    this.textAlign,
    this.isFocused = false,
    this.characterLimit,
    this.isReadOnly = false,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 82,
      width: width ?? 62,
      decoration: BoxDecoration(
        color: AppColors.white,
        border: Border.all(
          color: AppColors.primaryFieldLabelTextColor,
          width: 1.0,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(10.0),
        ),
      ),
      child: Center(
        child: TextFormField(
          readOnly: isReadOnly,
          maxLines: 1,
          keyboardType: TextInputType.number,
          onChanged: (value) {
            // Pass the current value to the onChanged callback
            onChanged?.call(value);
          },
          autofocus: isFocused,
          style: TextStyle(
            fontFamily: AppTheme.primaryFont,
            fontSize: 26,
            fontWeight: FontWeight.bold,
            color: AppColors.primaryFieldLabelTextColor,
          ),
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 20),
            border: InputBorder.none,
          ),
          inputFormatters: [
            LengthLimitingTextInputFormatter(characterLimit ?? -1),
          ],
          controller: controller,
          onSaved: (value) => onSaved?.call(value?.trim() ?? ''),
          validator: (value) => validator?.call(value?.trim() ?? ''),
          onTap: onTapped,
        ),
      ),
    );
  }
}
