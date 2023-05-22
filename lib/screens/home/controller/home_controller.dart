import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:reel_time/screens/home/model/model.dart';
import 'package:reel_time/screens/home/service/service.dart';

class HomeController extends GetxController {
  HomeController() {
    getMovies();
  }
  HomeService homeService = HomeService();
  List<Result> moviesList = [];

  bool isLoading = false;
  void getMovies() async {
    isLoading = true;
    update();
    await homeService.getMoviesApi().then(
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

  Result findByallmoviesId(int id) {
    // ignore: unrelated_type_equality_checks
    return moviesList.firstWhere((element) => element.id == id);
  }
}
