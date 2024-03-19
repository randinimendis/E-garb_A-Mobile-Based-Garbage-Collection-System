import 'package:chauffuer/theme/app_colors.dart';
import 'package:chauffuer/widgets/buttons/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../theme/app_theme.dart';
import 'intro_controller.dart';


class WalkthroughView extends GetView<WalkthroughController> {
  const WalkthroughView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: false,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Column(
              children: [
                //Page View - Image, Title and Description
                Expanded(
                  child: PageView.builder(
                    itemCount: controller.pageCount,
                    controller: controller.pageController,
                    onPageChanged: controller.onPageChanged,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          //Image
                          Image.asset(
                            controller.getImagePath(index),
                            width: controller.imageWidth,
                            height: controller.imageHeight,
                            fit: BoxFit.cover,
                          ),

                          const SizedBox(height: 60),

                          //Title
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 30),
                            child: Text(
                              controller.getTitle(index),
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontFamily: AppTheme.primaryFont,
                                fontWeight: FontWeight.w700,
                                fontSize: 26,
                              ),
                            ),
                          ),

                          const SizedBox(height: 20),

                          //Description
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 30),
                            child: Text(
                              controller.getDescription(index),
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontFamily: AppTheme.primaryFont,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),

                //Next button
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Obx(()=>
                      PrimaryButton(backgroundColor:AppColors.buttonsColor,
                          title: controller.nextButtonText,
                          onPressed: controller.onNextButtonPressed),
                    )),

                //Skip Button
                Obx(
                  () => Visibility(
                    maintainState: true,
                    maintainAnimation: true,
                    maintainSize: true,
                    visible: !controller.isLastPage,
                    child: TextButton(
                      onPressed: controller.onSkipButtonPressed,
                      child: Text(
                        'Skip',
                        style: TextStyle(
                          fontSize: 15,
                          fontFamily: AppTheme.primaryFont,
                          fontWeight: FontWeight.w700,
                          color: AppColors.lightGray,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),

            //Page indicator - dots
            Positioned(
              top: controller.imageHeight + 20,
              child: Obx(
                () => Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    controller.pageCount,
                    (index) => createPageIndicator(index, context),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container createPageIndicator(int index, BuildContext context) {
    return Container(
      height: 7,
      width: controller.currentIndex == index ? 25 : 7,
      margin: const EdgeInsets.only(right: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: controller.currentIndex == index
            ? AppColors.primaryColor
            : AppColors.lightGray,
      ),
    );
  }
}