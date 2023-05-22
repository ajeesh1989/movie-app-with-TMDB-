import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reel_time/image/image.dart';
import 'package:reel_time/screens/home/controller/home_controller.dart';
import 'package:reel_time/screens/moviedetails/view/movie_details.dart';

// ignore: must_be_immutable
class AllDetails extends StatelessWidget {
  AllDetails({super.key});

  HomeController homeController = Get.put(HomeController());

  double height = Get.height;
  double width = Get.width;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        title: const Text(
          'Trending Now',
          style: TextStyle(fontSize: 20),
        ),
      ),
      body: GetBuilder<HomeController>(
        builder: (controller) => GridView.builder(
          itemCount: homeController.moviesList.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 5,
              mainAxisSpacing: 5,
              childAspectRatio: 1 / 1.85),
          itemBuilder: (context, index) {
            return GridTile(
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.to(
                          DetailPage(id: homeController.moviesList[index].id!));
                    },
                    child: Container(
                      height: height * 0.35,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(
                                "${ImageUrl().imageAppUrl}${homeController.moviesList[index].posterPath}"),
                            fit: BoxFit.cover),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    homeController.moviesList[index].title.toString(),
                    style: const TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
