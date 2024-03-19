import 'package:chauffuer/data/models/business_models/intro_page.dart';
import 'package:chauffuer/data/storage/user_defaults.dart';
import 'package:chauffuer/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WalkthroughController extends GetxController {
  final _currentIndex = 0.obs;
  final _walkthroughPages = [
    OnboardingContent(
        title: 'Explore the Road',
        image: 'assets/images/Explore.png',
        description:
            "Discover the joy of driving with our premium car rental service. Whether it's a weekend getaway or a business trip, we have the perfect ride for you."),
    OnboardingContent(
        title: 'Exclusive Offers',
        image: 'assets/images/Exclusive.png',
        description:
            "Enjoy exclusive rewards and surprises as a loyal customer. From discounts on future rentals to special perks, our rewards program is designed to make your journey even more memorable."),
    OnboardingContent(
        title: 'Convenient Booking',
        image: 'assets/images/Convenient.png',
        description:
            "Our easy-to-use app allows you to book your dream car in just a few taps. Choose the model, select the rental period, and hit the road in style."),
  ];
  final _screenWidth = Get.width;
  final _screenHeight = Get.height;
  final PageController _pageController = PageController();

  //var storage = GetStorage();

  //Getter setters
  int get currentIndex => _currentIndex.value;
  String get nextButtonText => isLastPage ? "Let's get started" : 'Next';
  double get imageWidth => _screenWidth;
  double get imageHeight => _screenHeight / 2;
  PageController get pageController => _pageController;
  int get pageCount => _walkthroughPages.length;
  bool get isLastPage => _currentIndex.value == _walkthroughPages.length - 1;

  String getImagePath(int index) {
    final page = _walkthroughPages[index];
    return page.image;
  }

  String getTitle(int index) {
    final page = _walkthroughPages[index];
    return page.title;
  }

  String getDescription(int index) {
    final page = _walkthroughPages[index];
    return page.description;
  }

  void onPageChanged(int index) {
    _currentIndex.value = index;
  }

  void onNextButtonPressed() {
    if (isLastPage) {
      UserDefaults.shared.isFirstRun = false;
      Get.offNamed(AppRoutes.login);
      return;
    }
    pageController.nextPage(
        duration: const Duration(milliseconds: 500), curve: Curves.linear);
  }

  void onSkipButtonPressed() {
    UserDefaults.shared.isFirstRun = false;
    Get.offNamed(AppRoutes.login);
  }
}
