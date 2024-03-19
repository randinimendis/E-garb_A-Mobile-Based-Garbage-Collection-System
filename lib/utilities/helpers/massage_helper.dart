
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../theme/app_colors.dart';
import '../../theme/app_theme.dart';
import '../enums.dart';


class MessageHelper {
  static snackBar(MessageType type, String title, String message) {
    var isKindOfError =
        type == MessageType.error || type == MessageType.exception;
    return Get.snackbar(
      title,
      message,
      backgroundColor: isKindOfError
          ? AppColors.errorMessageBackgroundColor
          : AppColors.primaryBackgroundColor,
      borderRadius: 10,
      barBlur: 0,
      titleText: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Text(
          title,
          style: TextStyle(
            fontFamily: "FiraSans",
            fontSize: 15.0,
            fontWeight: FontWeight.w600,
            color: isKindOfError
                ? AppColors.errorMessageTextColor
                : AppColors.primaryColor,
          ),
        ),
      ),
      messageText: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Text(
          message,
          style: TextStyle(
            fontFamily: "FiraSans",
            fontSize: 15.0,
            color: isKindOfError
                ? AppColors.errorMessageTextColor
                : AppColors.primaryColor,
          ),
        ),
      ),
      icon: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Icon(
          isKindOfError
              ? Icons.warning_amber
              : Icons.check_circle_outline,
          color: isKindOfError
              ? AppColors.errorMessageTextColor
              : AppColors.primaryColor,
        ),
      ),
      shouldIconPulse: false,
    );
  }

  static bottomSheet(String title, String message, Function() onConfirm) {
    return Get.bottomSheet(
      Container(
        height: 210,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20),
            topLeft: Radius.circular(20),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0),
          child: Column(
            children: [
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.check_circle_outline,
                    color: Colors.amber,
                  ),
                  const SizedBox(width: 10),
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 20,
                      fontFamily: 'VarelaRound',
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF4E6B8C),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              Text(
                message,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 16,
                  fontFamily: 'VarelaRound',
                  color: Color(0xFF7F7F7F),
                ),
              ),
              const Spacer(),
              //Buttons
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      child: const Text(
                        'CANCEL',
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: 'VarelaRound',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        foregroundColor: const Color(0xFFFFFFFF), backgroundColor: const Color(0xFF1E90CF),
                        minimumSize: const Size(0, 45),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      onPressed: () {},
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: ElevatedButton(
                      child: const Text(
                        'CONFIRM',
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: 'VarelaRound',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        foregroundColor: const Color(0xFFFFFFFF), backgroundColor: const Color(0xFF1E90CF),
                        minimumSize: const Size(0, 45),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      onPressed: () {
                        onConfirm;
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }

  static confirmDialog({
    required String title,
    required String message,
    String confirmButtonText = "CONFIRM",
    String cancelButtonText = "CANCEL",
    Function()? onConfirm,
    Function()? onCancel,
  }) {
    return Get.dialog(
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Material(
                  color: Colors.white,
                  child: Column(
                    children: [
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.check_circle_outline,
                            color: Colors.amber,
                          ),
                          const SizedBox(width: 10),
                          Text(
                            title,
                            style: const TextStyle(
                              fontSize: 20,
                              fontFamily: 'VarelaRound',
                              fontWeight: FontWeight.w700,
                              color: Color(0xFF4E6B8C),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 15),
                      Text(
                        message,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 16,
                          fontFamily: 'VarelaRound',
                          color: Color(0xFF7F7F7F),
                        ),
                      ),
                      const SizedBox(height: 20),
                      //Buttons
                      Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              child: const Text(
                                'CANCEL',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: 'VarelaRound',
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              style: ElevatedButton.styleFrom(
                                foregroundColor: const Color(0xFFFFFFFF), backgroundColor: const Color(0xFF1E90CF),
                                minimumSize: const Size(0, 45),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              onPressed: onCancel ??
                                      () {
                                    Get.back();
                                  },
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: ElevatedButton(
                              child: Text(
                                confirmButtonText.toUpperCase(),
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontFamily: 'VarelaRound',
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              style: ElevatedButton.styleFrom(
                                foregroundColor: const Color(0xFFFFFFFF), backgroundColor: const Color(0xFF1E90CF),
                                minimumSize: const Size(0, 45),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              onPressed: onConfirm ??
                                      () {
                                    Get.back();
                                  },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      transitionDuration: const Duration(milliseconds: 100),
    );
  }
}