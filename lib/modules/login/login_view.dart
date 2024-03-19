import 'package:chauffuer/theme/app_colors.dart';
import 'package:chauffuer/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../widgets/buttons/primary_button.dart';
import '../../widgets/text_fields/form_text_field.dart';
import 'login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryBackgroundColor,
      body: Stack(
        children: [
          SafeArea(
            bottom: false,
            child: SizedBox(
              height: double.infinity,
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics(),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  children: [
                    const SizedBox(height: 150),
                    const Text(
                      'Login',
                      style: TextStyle(
                        fontSize: 30,
                        fontFamily: AppTheme.primaryFont,
                      ),
                    ),
                    const SizedBox(height: 110),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Obx(
                        () => Form(
                          key: controller.formKey,
                          autovalidateMode: controller.shouldValidate
                              ? AutovalidateMode.onUserInteraction
                              : AutovalidateMode.disabled,
                          child: Column(
                            children: [
                              FormTextField(
                                labelText: 'Phone Number',
                                placeholderText: 'Your Phone Number',
                                textType: TextInputType.phone,
                                controller: controller.phoneController,
                                onSaved: controller.onPhoneSaved,
                                validator: controller.phoneValidator,
                                validationMessage:
                                    controller.phoneValidationMassage,
                              ),
                              const SizedBox(height: 25),
                              FormTextField(
                                labelText: 'Password (min. 8 characters)',
                                placeholderText: 'Your password',
                                textType: TextInputType.visiblePassword,
                                isSecureText: controller.isPasswordHidden,
                                controller: controller.passwordController,
                                onSaved: controller.onPasswordSaved,
                                validator: controller.passwordValidator,
                                validationMessage:
                                    controller.passwordValidationMessage,
                                suffixIcon: controller.passwordSuffixIcon,
                                onSuffixIconPressed:
                                    controller.onPasswordSuffixIconPressed,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 35),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: PrimaryButton(
                        onPressed: () {
                          controller.onLoginButtonPressed();
                        },
                        backgroundColor: AppColors.buttonsColor,
                        title: "Login",
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text(
                                'Forgot Password',
                                style: TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              content: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Text(
                                    'Enter your registered email to reset your password:',
                                    style: TextStyle(
                                      fontSize: 16.0,
                                    ),
                                  ),
                                  SizedBox(height: 10.0),
                                  TextFormField(
                                    decoration: InputDecoration(
                                      labelText: 'Email',
                                      hintText: 'Enter your registered Email',
                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        borderSide: BorderSide(
                                            color: AppColors.textColor),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              actions: <Widget>[
                                ElevatedButton(
                                  onPressed: () {
                                    Get.back();
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        AppColors.buttonsColor,
                                  ),
                                  child: Text(
                                    'Reset Password',
                                    style: TextStyle(
                                      color: AppColors.white,
                                    ),
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Get.back();
                                  },
                                  style: TextButton.styleFrom(
                                    foregroundColor:
                                        AppColors.errorMessageTextColor,
                                  ),
                                  child: Text('Cancel'),
                                ),
                              ],
                            );
                          },
                        );
                      },
                      style: TextButton.styleFrom(
                        foregroundColor: AppColors.primaryButtonColor,
                      ),
                      child: Text(
                        'Forgot password?',
                        style: TextStyle(
                          fontSize: 15,
                          fontFamily: AppTheme.primaryFont,
                          fontWeight: FontWeight.w500,
                          color: AppColors.primaryButtonColor,
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Don’t have an account yet?',
                          style: TextStyle(
                            fontSize: 14,
                            fontFamily: AppTheme.primaryFont,
                            fontWeight: FontWeight.w500,
                            color: AppColors.primaryFieldLabelTextColor,
                          ),
                        ),
                        TextButton(
                          onPressed: controller.onSignUpButtonPressed,
                          child: Text(
                            'Sign Up',
                            style: TextStyle(
                              fontSize: 14,
                              fontFamily: AppTheme.primaryFont,
                              fontWeight: FontWeight.w500,
                              color: AppColors.primaryColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Obx(
            () => controller.isLoading
                ? Stack(
                    children: [
                      Container(
                        width: double.infinity,
                        height: double.infinity,
                        color: AppColors.popupShadowColor,
                      ),
                      Center(
                        child: CircularProgressIndicator(
                          color: AppColors.primaryColor,
                        ),
                      ),
                    ],
                  )
                : Container(),
          ),
        ],
      ),
    );
  }
}
