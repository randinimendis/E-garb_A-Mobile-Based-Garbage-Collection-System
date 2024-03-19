import 'package:chauffuer/modules/signUp/signup_controller.dart';
import 'package:chauffuer/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../theme/app_colors.dart';
import '../../widgets/buttons/primary_button.dart';
import '../../widgets/text_fields/form_text_field.dart';

class SignupView extends GetView<SignupController> {
  const SignupView({Key? key}) : super(key: key);

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
                    const SizedBox(height: 50),
                    Center(
                      child: const Text(
                        'Sign Up',
                        style: TextStyle(
                          fontSize: 30,
                          fontFamily: AppTheme.primaryFont,
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Obx(
                        () => Form(
                          key: controller.formKey,
                          child: Column(
                            children: [
                              SizedBox(height: 10.0),

                              FormTextField(
                                labelText: 'First Name',
                                placeholderText: 'Your First Name',
                                textType: TextInputType.name,
                                controller: controller.FirstNameController,
                                validator: controller.FirstNameValidator,
                                onSaved: controller.onFirstNameSaved,
                                validationMessage:
                                    controller.nameValidationMassage,
                              ),

                              SizedBox(height: 10.0),

                              FormTextField(
                                labelText: 'Last Name',
                                placeholderText: 'Your Last Name',
                                textType: TextInputType.name,
                                controller: controller.LastNameController,
                                validator: controller.LastNameValidator,
                                onSaved: controller.onLastNameSaved,
                                validationMessage:
                                    controller.nameValidationMassage,
                              ),

                              SizedBox(height: 10.0),

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

                              SizedBox(height: 10.0),

                              //Email
                              FormTextField(
                                labelText: 'Email address',
                                placeholderText: 'Your Email Address',
                                textType: TextInputType.emailAddress,
                                controller: controller.EmailController,
                                onSaved: controller.onEmailSaved,
                                validator: controller.emailValidator,
                                validationMessage:
                                    controller.emailValidationMessage,
                              ),

                              SizedBox(height: 10.0),

                              FormTextField(
                                labelText: 'Password (min. 8 characters)',
                                placeholderText: 'Your Password',
                                textType: TextInputType.visiblePassword,
                                isSecureText: controller.isPasswordHidden,
                                controller: controller.PasswordController,
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
                    const SizedBox(height: 25),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: PrimaryButton(
                        onPressed: () {
                          controller.onSingUpButtonPressed();
                        },
                        backgroundColor: AppColors.buttonsColor,
                        title: "SignUp",
                      ),
                    ),
                    Obx(
                      () => Visibility(
                        visible: controller.loginErrorMessage.isNotEmpty,
                        child: Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(16),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color:
                                    AppColors.errorMessageBackgroundColor,
                              ),
                              child: Text(
                                controller.loginErrorMessage,
                                style: AppTheme.errorText,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Already have an account ?',
                          style: TextStyle(
                            fontSize: 14,
                            fontFamily: AppTheme.primaryFont,
                            fontWeight: FontWeight.w500,
                            color: AppColors.primaryFieldLabelTextColor,
                          ),
                        ),
                        TextButton(
                          onPressed: controller.SignUpButtonPressed,
                          child: Text(
                            'Login',
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
                    const SizedBox(height: 30),
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
