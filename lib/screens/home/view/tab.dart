import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:reel_time/screens/alldetails/all_details.dart';
import 'package:reel_time/screens/moviedetails/view/movie_details.dart';
import 'package:reel_time/screens/search/view/search.dart';

import 'package:reel_time/image/image.dart';
import 'package:reel_time/screens/home/controller/home_controller.dart';

// ignore: must_be_immutable
class MyHome extends StatelessWidget {
  MyHome({Key? key}) : super(key: key);

  HomeController homeController = Get.put(HomeController());

  double height = Get.height;

  double width = Get.width;

  @override
  Widget build(BuildContext context) {
    final homecontroller = Get.put(HomeController());
    homecontroller.getMovies();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          "ReelTime",
          style: GoogleFonts.manrope(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Get.to(() => SearchPage());
            },
            icon: const Icon(
              Icons.search_rounded,
              color: Colors.white,
              size: 25,
            ),
          )
        ],
      ),
      backgroundColor: Colors.black,
      body: GetBuilder<HomeController>(
        builder: (controller) => SafeArea(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                child: Column(
                  children: [
                    // SizedBox(
                    //   width: MediaQuery.of(context).size.width,
                    //   height: 50,
                    //   child: Row(
                    //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //     children: [
                    //       Padding(
                    //         padding: const EdgeInsets.all(5.0),
                    //         child: Text(
                    //           "ReelTime",
                    //           style: GoogleFonts.manrope(
                    //               color: Colors.white,
                    //               fontWeight: FontWeight.bold,
                    //               fontSize: 25),
                    //         ),
                    //       ),
                    //       IconButton(
                    //         onPressed: () {
                    //           Get.to(() => SearchPage());
                    //         },
                    //         icon: const Icon(
                    //           Icons.search_rounded,
                    //           color: Colors.white,
                    //           size: 25,
                    //         ),
                    //       )
                    //     ],
                    //   ),
                    // ),

                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 15.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "New Release",
                                style: GoogleFonts.manrope(
                                    color: Colors.white,
                                    fontSize: 17,
                                    fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: height * 0.52,
                          margin: const EdgeInsets.only(
                              left: 15, right: 15, top: 15),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12)),
                          child: PageView.builder(
                            itemCount: homeController.moviesList.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  Get.to(
                                    DetailPage(
                                        id: homecontroller
                                            .moviesList[index].id!),
                                  );
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: NetworkImage(
                                              "${ImageUrl().imageAppUrl}${homeController.moviesList[index].posterPath}"),
                                          fit: BoxFit.fill),
                                      borderRadius: BorderRadius.circular(12)),
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: height * 0.44,
                                      ),
                                      Row(
                                        children: [
                                          const SizedBox(
                                            width: 15,
                                          ),
                                          Container(
                                            width: 45,
                                            height: 45,
                                            decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: Colors.grey
                                                    .withOpacity(0.3)),
                                            child: const Center(
                                              child: Icon(
                                                Icons.play_arrow_rounded,
                                                color: Colors.white,
                                                size: 35,
                                              ),
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            "Play now",
                                            style: GoogleFonts.manrope(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 18),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 15, right: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Trending Now",
                            style: GoogleFonts.manrope(
                                color: Colors.white,
                                fontSize: 17,
                                fontWeight: FontWeight.w700),
                          ),
                          IconButton(
                              onPressed: () {
                                Get.to(() => AllDetails());
                              },
                              icon: const Icon(
                                Icons.keyboard_arrow_right_rounded,
                                color: Colors.white,
                                size: 25,
                              ))
                        ],
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 200,
                      child: GridView.builder(
                        itemCount: homeController.moviesList.length,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 1, childAspectRatio: 2 / 1.7),
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              Get.to(
                                DetailPage(
                                    id: homecontroller.moviesList[index].id!),
                              );
                            },
                            child: Container(
                              width: 100,
                              height: 200,
                              margin: const EdgeInsets.only(left: 10, right: 5),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    width: width * 0.41,
                                    height: height * 0.192,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8)),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(8),
                                      child: Image.network(
                                        "${ImageUrl().imageAppUrl}${homeController.moviesList[index].backdropPath}",
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    homeController.moviesList[index].title
                                        .toString(),
                                    style: GoogleFonts.manrope(
                                        color: Colors.white,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
