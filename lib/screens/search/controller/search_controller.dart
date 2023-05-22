import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:reel_time/screens/moviedetails/controller/movie_detailsController.dart';
import 'package:reel_time/screens/moviedetails/model/movie_model.dart';
import 'package:reel_time/screens/search/model/search_model.dart';
import 'package:reel_time/screens/search/service/search_service.dart';

class SearchController extends GetxController {
  @override
  void onInit() {
    getMovieList('a');

    super.onInit();
  }

  bool isLoading = true;
  SearchModel? searchModel;
  List<SearchModel> searchList = [];
  TextEditingController textEditingController = TextEditingController();
  void getMovieList(String query) async {
    log('message');
    isLoading = true;
    update();
    await SearchService().searchMovies(query).then((value) {
      log(value.toString(), name: 'contr');
      if (value != null) {
        searchList = value;
        update();
        isLoading = false;
        update();
      } else {
        isLoading = true;
        update();
        log('value empty');
      }
    });
    isLoading = false;
    update();
  }
}
