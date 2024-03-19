import 'package:chauffuer/data/models/responses/profile_response.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:dio/dio.dart';
import '../../utilities/constants/api_constants.dart';
import '../../utilities/constants/message_constants.dart';

class ProfileProvider {
  final dio = Dio(BaseOptions(baseUrl: ApiConstants.baseUrl));

  Future<dynamic> getProfile() async {
    if (!await InternetConnectionChecker().hasConnection) {
      return Future.error(MessageConstants.noInternetConnection);
    }
    final headers = {
      "Content-Type": "application/json",
      "Authorization":
          "Bearer eyJhbGciOiJIUzUxMiIsInR5cCI6IkpXVCIsImN0eSI6IkpXVCJ9.eyJlbWFpbCI6ImFraWxhZmRvMjAwMTlAZ21haWwuY29tIiwiZ2l2ZW5fbmFtZSI6IkFzaGVuIE1hZGh1Iiwic3ViIjoiMTAiLCJyb2xlIjoiQ29tcGFueSIsIm5iZiI6MTcxMDM4OTQ5OSwiZXhwIjoxNzEwMzkzMDk5LCJpYXQiOjE3MTAzODk0OTksImlzcyI6Imh0dHBzOi8vbG9jYWxob3N0OjE0MzMifQ.6SmyQE1gw520vnD4dFVzlN11MOYVvmiV8yvLB6D6TN0jahrcNQDBTkVmSZ3dUseow-iezBYjkXu3-aqCEYwwjg",
    };
    final query = {"Id": "9"};
    try {
      final response = await dio.get(
        ApiConstants.getPassengerByID,
        queryParameters: query,
        options: Options(headers: headers),
      );
      if (response.statusCode != 200) {
        return Future.error(response.statusMessage!);
      } else {
        return response.data;
      }
    } catch (exception) {
      print(exception);
      return Future.error(MessageConstants.userExistsErrorMessage);
    }
  }

  Future<dynamic> updateProfile() async {
    if (!await InternetConnectionChecker().hasConnection) {
      return Future.error(MessageConstants.noInternetConnection);
    }
  }
}
