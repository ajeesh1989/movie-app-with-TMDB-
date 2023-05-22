import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:reel_time/common/api_baseurl.dart';
import 'package:reel_time/common/api_endurl.dart';
import 'package:reel_time/screens/home/model/model.dart';

class HomeService {
  Dio dio = Dio();
  final baseUrl = BaseUrl();
  final endUrl = EndUrl();

  Future<List<Result>?> getMoviesApi() async {
    try {
      final response = await dio.get(baseUrl.apiBaseurl + endUrl.getMovie);
      log(response.statusCode.toString());
      log(response.data.toString());
      if (response.statusCode == 200 || response.statusCode == 201) {
        final result = (response.data["results"] as List)
            .map((e) => Result.fromJson(e))
            .toList();
        return result;
      }
      return null;
    } on DioError catch (error) {
      log(error.message.toString());
      Get.snackbar('Something went wrong', error.message.toString(),
          snackPosition: SnackPosition.BOTTOM);
    }
    return null;
  }
}
