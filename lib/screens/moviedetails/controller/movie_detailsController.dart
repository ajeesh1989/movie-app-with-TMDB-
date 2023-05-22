import 'dart:developer';

import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:reel_time/screens/moviedetails/model/movie_model.dart';

import '../service/movie_service.dart';

class MovieController extends GetxController {
  MovieController() {
    getMovieDetails();
  }
  DetailsService detailsService = DetailsService();
  List<DetailsMovie> moviesList = [];
  bool isLoading = false;
  void getMovieDetails() async {
    isLoading = true;
    update();
    await detailsService.getMovieDetails().then(
      (value) {
        if (value != null) {
          moviesList = value;
          update();
        } else {
          isLoading = false;
          update();
        }
      },
    );
    isLoading = false;
    update();
  }
}
