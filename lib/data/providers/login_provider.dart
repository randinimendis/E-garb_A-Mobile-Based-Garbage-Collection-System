import 'package:chauffuer/data/models/requests/login_request.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:dio/dio.dart';
import '../../utilities/constants/api_constants.dart';
import '../../utilities/constants/message_constants.dart';

class LoginProvider {
  final dio = Dio(BaseOptions(baseUrl: ApiConstants.baseUrl));

  Future<Response> loginUser(LoginRequest loginData) async {
    if (!await InternetConnectionChecker().hasConnection) {
      return Future.error(MessageConstants.noInternetConnection);
    }

    final headers = {
      "Content-Type": "application/json",
    };

    try {
      final response = await dio.post(
        ApiConstants.loginUser,
        data: loginData.toJson(),
        options: Options(headers: headers),
      );
      if (response.statusCode != 200) {
        return Future.error(response.statusMessage!);
      } else {
        return response;
      }
    } catch (exception) {
      print(exception);
      return Future.error(MessageConstants.userExistsErrorMessage);
    }
  }

  Future<Response> loginWithOtp(String phoneNumber, String otpCode) async {
    if (!await InternetConnectionChecker().hasConnection) {
      return Future.error(MessageConstants.noInternetConnection);
    }

    final headers = {
      "Content-Type": "application/json",
    };
    Map<String, String> parameters = {
      "phoneNumber": phoneNumber,
      "code": otpCode
    };
    print(otpCode);

    try {
      final response = await dio.post(
        ApiConstants.loginWithOtp,
        queryParameters: parameters,
        options: Options(headers: headers),
      );
      if (response.statusCode != 200) {
        return Future.error(response.statusMessage!);
      } else {
        return response;
      }
    } catch (exception) {
      print(exception);
      return Future.error(MessageConstants.invalidOtpErrorMessage);
    }
  }
}
