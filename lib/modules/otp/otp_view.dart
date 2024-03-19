import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_theme.dart';
import '../../widgets/buttons/primary_button.dart';
import '../../widgets/text_fields/number_form_text_field.dart';
import 'otp_controller.dart';

class OTPView extends GetView<OTPController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Get.back(),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 50),
            Text(
              'Verify phone number',
              style: TextStyle(
                color: AppColors.textColor,
                fontSize: 28,
                fontFamily: 'Inter',
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              'We sent on Your email a 6-digit verification code',
              style: TextStyle(
                color: AppColors.textColor,
                fontSize: 14,
                fontFamily: 'Inter',
              ),
            ),
            SizedBox(height: 80.0),
            Form(
              key: controller.formKey,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  6,
                  (index) => Row(
                    children: [
                      NumberFormTextField(
                        controller: controller.otpCodeControllers[index],
                        characterLimit: 1,
                        onChanged: (value) {
                          if (value?.isNotEmpty == true && index < 5) {
                            Get.focusScope!.nextFocus();
                          }
                          controller.onOTPSaved(index);
                        },
                      ),
                      SizedBox(
                        width: 8.0,
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 8.0),
            Obx(() => TextButton(
                  onPressed: controller.remainingTime == 0
                      ? () {
                          controller.resetTimer();
                        }
                      : null,
                  child: Text(
                    controller.remainingTime == 0
                        ? 'Resend code'
                        : 'Resend code (${controller.remainingTime} s)',
                    style: TextStyle(
                      fontSize: 14,
                      fontFamily: AppTheme.primaryFont,
                      color: controller.remainingTime == 0
                          ? AppColors.primaryColor
                          : AppColors.textColor,
                    ),
                  ),
                )),
            SizedBox(height: 250.0),
            Obx(() => Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: PrimaryButton(
                    onPressed: controller.isLoading
                        ? null
                        : () {
                            controller.onOTPButtonPressed();
                          },
                    backgroundColor: AppColors.buttonsColor,
                    title: controller.isLoading ? "Loading..." : "Verify",
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
