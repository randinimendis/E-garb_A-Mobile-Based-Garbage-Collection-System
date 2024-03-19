import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_theme.dart';

class FormTextField extends StatefulWidget {
  final Function(String? value)? onSaved;
  final String? Function(String? value)? validator;
  final TextEditingController controller;
  final TextInputType textType;
  final RxBool? isSecureText;
  final RxString validationMessage;
  final String? prefixIcon;
  final IconData? suffixIcon;
  final Function()? onSuffixIconPressed;
  final Function()? onTapped;
  final String? labelText;
  final String? placeholderText;
  final double? height;
  final TextAlign? textAlign;
  final bool isFocused;
  final int? characterLimit;
  final bool isReadOnly;
  final bool hideValidationMessage;
  final int? maxLines;
  final int? maxLength;
  final Function(String? value)? onChanged;
  final Color backgroundColor;
  final Widget? suffixWidget;
  final FocusNode? focusNode;
  bool get _isSecureField => isSecureText?.value ?? false;
  bool get hasLabel => labelText != null;
  bool get hasPrefixIcon => prefixIcon != null;
  bool get hasSuffixIcon => suffixIcon != null || suffixWidget != null;
  bool get isValid => validationMessage.value.isEmpty;

  FormTextField({
    super.key,
    this.labelText,
    this.placeholderText,
    this.textType = TextInputType.none,
    this.isSecureText,
    required this.controller,
    this.onSaved,
    this.validator,
    validationMessage,
    this.prefixIcon,
    this.suffixIcon,
    this.onSuffixIconPressed,
    this.onTapped,
    this.height,
    this.textAlign,
    this.isFocused = false,
    this.characterLimit,
    this.isReadOnly = false,
    this.hideValidationMessage = false,
    this.maxLines,
    this.onChanged,
    backgroundColor,
    suffixWidget,
    this.focusNode,
    this.maxLength,
  })  : validationMessage = validationMessage ?? ''.obs,
        backgroundColor = backgroundColor ?? AppColors.white,
        suffixWidget = suffixWidget ??
            IconButton(
              icon: Icon(
                suffixIcon,
                color: AppColors.primaryTextFieldPlaceholderTextColor,
              ),
              splashColor: Colors.transparent,
              onPressed: onSuffixIconPressed,
            );

  @override
  _FormTextFieldState createState() => _FormTextFieldState();
}

class _FormTextFieldState extends State<FormTextField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //Label
        if (widget.hasLabel) ...[
          Obx(
            () => Text(
              widget.labelText ?? '',
              style: TextStyle(
                fontSize: 14,
                fontFamily: AppTheme.primaryFont,
                fontWeight: FontWeight.w600,
                color: widget.isValid
                    ? AppColors.primaryFieldLabelTextColor
                    : AppColors.errorMessageTextColor,
              ),
            ),
          ),
          const SizedBox(height: 5),
        ],

        //Text Field
        Obx(
          () => Container(
            height: widget.height ?? 52,
            padding: EdgeInsets.only(
                left: widget.hasPrefixIcon ? 0 : 16,
                right: widget.hasSuffixIcon ? 0 : 16),
            decoration: BoxDecoration(
              color: widget.backgroundColor,
              border: Border.all(
                color: widget.isValid
                    ? AppColors.primaryFieldLabelTextColor
                    : AppColors.errorMessageTextColor,
                width: 1.0,
              ),
              borderRadius: const BorderRadius.all(
                Radius.circular(10.0),
              ),
            ),
            child: Center(
              child: TextFormField(
                focusNode: widget.focusNode,
                maxLength: widget.maxLength,
                readOnly: widget.isReadOnly,
                obscureText: widget._isSecureField,
                maxLines: widget.maxLines ?? 1,
                keyboardType: widget.textType,
                onChanged: widget.onChanged,
                textAlign: widget.textAlign ?? TextAlign.left,
                autofocus: widget.isFocused,
                style: TextStyle(
                  fontFamily: AppTheme.primaryFont,
                  fontSize: 16,
                  color: AppColors.primaryFieldLabelTextColor,
                ),
                decoration: InputDecoration(
                  errorStyle: const TextStyle(height: 0),
                  border: InputBorder.none,
                  hintText: widget.placeholderText,
                  hintStyle: TextStyle(
                    fontFamily: AppTheme.primaryFont,
                    fontSize: 16,
                    color: AppColors.primaryTextFieldPlaceholderTextColor,
                  ),
                  suffixIcon: widget.hasSuffixIcon ? widget.suffixWidget : null,
                ),
                inputFormatters: [
                  LengthLimitingTextInputFormatter(widget.characterLimit ?? -1),
                ],
                controller: widget.controller,
                onSaved: (value) => widget.onSaved?.call(value?.trim() ?? ''),
                validator: (value) =>
                    widget.validator?.call(value?.trim() ?? ''),
                onTap: widget.onTapped,
              ),
            ),
          ),
        ),

        //Validation message
        if (!widget.hideValidationMessage) ...[
          Obx(
            () => widget.isValid
                ? Container()
                : Container(
                    alignment: Alignment.topLeft,
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Text(
                      widget.validationMessage.value,
                      style: TextStyle(
                        fontSize: 12,
                        fontFamily: AppTheme.primaryFont,
                        color: AppColors.errorMessageTextColor,
                      ),
                    ),
                  ),
          ),
        ],
      ],
    );
  }
}
