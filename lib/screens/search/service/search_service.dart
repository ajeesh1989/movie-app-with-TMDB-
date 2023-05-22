import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:reel_time/common/api_baseurl.dart';
import 'package:reel_time/common/api_endurl.dart';
import 'package:reel_time/screens/moviedetails/model/movie_model.dart';
import 'package:reel_time/screens/search/model/search_model.dart';

class SearchService {
  Dio dio = Dio();
  final baseUrl = BaseUrl();
  final endUrl = EndUrl();
  Future<List<SearchModel>?> searchMovies(String query) async {
    try {
      final response =
          await dio.get('${baseUrl.apiBaseurl}${endUrl.search}&query=$query');
      if (response.statusCode == 200 || response.statusCode == 201) {
        log(response.data.toString(), name: 'searchmnmmnbmbnmbbresult');
        List<SearchModel> result = [];
        result.add(SearchModel.fromJson(response.data));
        SearchModel.fromJson(response.data);
        return result;
      }
      return null;
    } on DioError catch (error) {
      log(error.message.toString());
    }
    return null;
  }
}
