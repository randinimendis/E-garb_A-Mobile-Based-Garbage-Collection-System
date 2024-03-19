
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:dio/dio.dart';
import '../../utilities/constants/api_constants.dart';
import '../../utilities/constants/message_constants.dart';
import '../models/requests/signup_reuest.dart';

class SignUpProvider {
  final dio = Dio(BaseOptions(baseUrl:  ApiConstants.baseUrl));

  Future<bool> signUpUser(SignUpRequest signupData) async {
    if (!await InternetConnectionChecker().hasConnection) {
      return Future.error(MessageConstants.noInternetConnection);
    }

    final headers = {
      "Content-Type": "application/json",
    };
    try {
      final response = await dio.post(
        ApiConstants.signupUser,
        data: signupData.toJson(),
        options: Options(
            headers: headers
        ),
      );
      if (response.statusCode != 200) {
        return Future.error(response.statusMessage!);
      } else {
        return response.data;
      }
    } catch (exception) {
      print(exception);
      return Future.error(MessageConstants.errorMessage);
    }
  }
}
