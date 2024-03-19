import 'package:chauffuer/modules/carList/car_list_binding.dart';
import 'package:chauffuer/modules/cardetails/car_details_binding.dart';
import 'package:chauffuer/modules/cardetails/car_details_view.dart';
import 'package:chauffuer/modules/driverDetails/driverDetails_view.dart';
import 'package:chauffuer/modules/home/home_binding.dart';
import 'package:chauffuer/modules/home/home_view.dart';
import 'package:chauffuer/modules/login/login_binding.dart';
import 'package:chauffuer/modules/login/login_view.dart';
import 'package:chauffuer/modules/signUp/signup_binding.dart';
import 'package:chauffuer/modules/signUp/signup_view.dart';
import '../data/storage/secure_storage.dart';
import '../data/storage/user_defaults.dart';
import '../modules/IntroScreen/intro_binding.dart';
import '../modules/IntroScreen/intro_view.dart';
import '../modules/booking/booking_binding.dart';
import '../modules/booking/booking_view.dart';
import '../modules/carList/car_list_view.dart';
import '../modules/driverDetails/driverDetails_binding.dart';
import '../modules/map/map_binding.dart';
import '../modules/map/map_view.dart';
import '../modules/otp/otp_binding.dart';
import '../modules/otp/otp_view.dart';
import '../modules/profile/profile_binding.dart';
import '../modules/profile/profile_view.dart';
import 'app_routes.dart';
import 'package:get/get.dart';

class AppPages {
  static get initial {
    final isFirstRun = UserDefaults.shared.isFirstRun;
    final hasLoggedIn = UserDefaults.shared.hasLoggedIn;

    if (isFirstRun) {
      SecureStorage.shared.clearSecureStorage();
      return AppRoutes.walkthrough;
    }
    if (hasLoggedIn) {
      return AppRoutes.carDetails;
    }
    return AppRoutes.login;
  }

  static final routes = [
    GetPage(
      name: AppRoutes.walkthrough,
      page: () => const WalkthroughView(),
      binding: WalkthroughBinding(),
      transition: Transition.downToUp,
      fullscreenDialog: true,
    ),
    GetPage(
      name: AppRoutes.login,
      page: () => const LoginView(),
      binding: LoginBinding(),
      transition: Transition.downToUp,
      fullscreenDialog: true,
    ),
    GetPage(
      name: AppRoutes.signUp,
      page: () => const SignupView(),
      binding: SignupBinding(),
      transition: Transition.downToUp,
      fullscreenDialog: true,
    ),
    GetPage(
      name: AppRoutes.home,
      page: () => HomeView(),
      binding: HomeBinding(),
      transition: Transition.downToUp,
      fullscreenDialog: true,
    ),
    GetPage(
      name: AppRoutes.carList,
      page: () => CarListView(),
      binding: CarListBinding(),
      transition: Transition.downToUp,
      fullscreenDialog: true,
    ),
    GetPage(
      name: AppRoutes.carDetails,
      page: () => CarView(),
      binding: CarDetailsBinding(),
      transition: Transition.downToUp,
      fullscreenDialog: true,
    ),
    GetPage(
      name: AppRoutes.booking,
      page: () => BookingView(),
      binding: BookingBinding(),
      transition: Transition.downToUp,
      fullscreenDialog: true,
    ),
    GetPage(
      name: AppRoutes.otp,
      page: () => OTPView(),
      binding: OTPBinding(),
      transition: Transition.downToUp,
      fullscreenDialog: true,
    ),
    GetPage(
      name: AppRoutes.map,
      page: () => MapView(),
      binding: MapBinding(),
      transition: Transition.downToUp,
      fullscreenDialog: true,
    ),
    GetPage(
      name: AppRoutes.driver,
      page: () => DriverView(),
      binding: DriverDetailsBinding(),
      transition: Transition.downToUp,
      fullscreenDialog: true,
    ),
    GetPage(
      name: AppRoutes.profile,
      page: () => ProfileView(),
      binding: ProfileDetailsBinding(),
      transition: Transition.downToUp,
      fullscreenDialog: true,
    ),
  ];
}
