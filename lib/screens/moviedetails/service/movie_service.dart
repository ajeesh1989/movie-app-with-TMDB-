import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:reel_time/common/api_baseurl.dart';
import 'package:reel_time/common/api_endurl.dart';
import 'package:reel_time/common/api_key.dart';
import 'package:reel_time/screens/moviedetails/model/movie_model.dart';

class DetailsService {
  final dio = Dio(BaseOptions());
  final baseurl = BaseUrl();
  final endUrl = EndUrl();
  Future<List<DetailsMovie>?> getMovieDetails() async {
    log(baseurl.apiBaseurl + endUrl.movieDetails);
    try {
      final response = await dio.get(baseurl.apiBaseurl + endUrl.movieDetails);
      if (response.statusCode == 200 || response.statusCode == 201) {
        log(response.data.toString());

        final result = (response.data["results"] as List)
            .map((e) => DetailsMovie.fromJson(e))
            .toList();
        return result;
      } else {
        return null;
      }
    } on DioError catch (e) {
      log(e.message.toString());
    }
    return null;
  }
}
