import 'package:chauffuer/modules/profile/profile_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../theme/app_colors.dart';
import '../../widgets/buttons/primary_button.dart';
import '../../widgets/text_fields/form_text_field.dart';
import '../../widgets/tiles/car_details_tile.dart';
import '../../widgets/tiles/profile_tile.dart';

class ProfileView extends GetView<ProfileDetailsController> {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(),
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(CupertinoIcons.back),
            onPressed: () => Get.back(),
          ),
        ),
        body: SingleChildScrollView(
          child: Obx(
                () => controller.isLoading
                ? CircularProgressIndicator()
                : Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Center(
                  child: SizedBox(
                    height: 60,
                    child: Text(
                      'Profile',
                      style: TextStyle(
                        color: AppColors.textColor,
                        fontSize: 28,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.64,
                      ),
                    ),
                  ),
                ),
                Container(
                  child: ProfileTile(
                      assetPath: 'assets/images/profile.png'),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      ListTile(
                        title: Text(
                          'First Name',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: FormTextField(
                          controller: controller.firstName,
                          isReadOnly: true,
                        ),
                      ),
                      Divider(
                        thickness: 1,
                        color: AppColors.lightGray,
                      ),
                      ListTile(
                        title: Text(
                          'Last Name',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: FormTextField(
                          controller: controller.lastName,
                          isReadOnly: true,
                        ),
                      ),
                      Divider(
                        thickness: 1,
                        color: AppColors.lightGray,
                      ),
                      ListTile(
                        title: Text(
                          'Gender',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: FormTextField(
                          controller: controller.gender,
                          isReadOnly: true,
                        ),
                      ),
                      Divider(
                        thickness: 1,
                        color: AppColors.lightGray,
                      ),
                      ListTile(
                        title: Text(
                          'Address',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: FormTextField(
                          controller: controller.address,
                          isReadOnly: true,
                        ),
                      ),
                      Divider(
                        thickness: 1,
                        color: AppColors.lightGray,
                      ),
                      ListTile(
                        title: Text(
                          'Phone Number',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: FormTextField(
                          controller: controller.phoneNumber,
                          isReadOnly: true,
                        ),
                      ),
                      Divider(
                        thickness: 1,
                        color: AppColors.lightGray,
                      ),
                      ListTile(
                        title: Text(
                          'Email Address',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: FormTextField(
                          controller: controller.email,
                          isReadOnly: true,
                        ),
                      ),

                      Divider(
                        thickness: 1,
                        color: AppColors.lightGray,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: PrimaryButton(
                    onPressed: () {
                      controller.onLogoutButtonPressed();
                    },
                    backgroundColor: AppColors.buttonsColor,
                    title: "Logout",
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
