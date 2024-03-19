import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:dio/dio.dart';
import '../../utilities/constants/api_constants.dart';
import '../../utilities/constants/message_constants.dart';

class VehicleListProvider {
  final dio = Dio(BaseOptions(baseUrl: ApiConstants.baseUrl));

  Future<List<dynamic>> getVehicleList(String token) async {
    if (!await InternetConnectionChecker().hasConnection) {
      return Future.error(MessageConstants.noInternetConnection);
    }

    final headers = {
      "Content-Type": "application/json",
      "Authorization":token
    };

    try {
      final response = await dio.get(
        ApiConstants.getAllVehicleList,
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
}
