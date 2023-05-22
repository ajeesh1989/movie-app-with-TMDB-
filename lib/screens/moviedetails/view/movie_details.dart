import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:reel_time/image/image.dart';
import 'package:reel_time/screens/home/controller/home_controller.dart';
import 'package:reel_time/screens/moviedetails/controller/movie_detailsController.dart';
import 'package:reel_time/screens/search/view/search.dart';

// ignore: must_be_immutable
class DetailPage extends StatelessWidget {
  DetailPage({super.key, required this.id});
  final detailControl = Get.put(MovieController());
  final int id;
  HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    // MovieController movieController = Get.put(MovieController());
    final findmovie = homeController.findByallmoviesId(id);
    double height = Get.height;
    return Scaffold(
      backgroundColor: Colors.black,
      body: GetBuilder<MovieController>(
        builder: (controller) => SafeArea(
          child: SingleChildScrollView(
            child: Stack(
              children: [
                SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    child: Image.network(
                      "${ImageUrl().imageAppUrl}${findmovie.posterPath}",
                      fit: BoxFit.cover,
                    )),
                Container(
                  margin: const EdgeInsets.only(top: 290),
                  width: MediaQuery.of(context).size.width,
                  height: 500,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [
                    Colors.black.withOpacity(0),
                    Colors.black.withOpacity(0.9),
                    Colors.black.withOpacity(0.9),
                    Colors.black.withOpacity(0.9)
                  ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
                ),
                Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      margin: const EdgeInsets.all(20),
                      child: Column(
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width,
                            height: 40,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: GlassmorphicContainer(
                                    linearGradient: const LinearGradient(
                                        colors: [
                                          Colors.white10,
                                          Colors.white10
                                        ]),
                                    blur: 10,
                                    width: 45,
                                    height: 45,
                                    borderRadius: 12,
                                    borderGradient: const LinearGradient(
                                        colors: [
                                          Colors.white10,
                                          Colors.white10
                                        ]),
                                    border: 1,
                                    child: Center(
                                      child: IconButton(
                                        onPressed: () {
                                          Get.back();
                                        },
                                        color: Colors.white,
                                        icon: const Icon(
                                          Icons.arrow_back_ios_rounded,
                                          size: 20,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                GlassmorphicContainer(
                                  linearGradient: const LinearGradient(
                                      colors: [Colors.white10, Colors.white10]),
                                  blur: 10,
                                  width: 45,
                                  height: 45,
                                  borderRadius: 12,
                                  borderGradient: const LinearGradient(
                                      colors: [Colors.white10, Colors.white10]),
                                  border: 1,
                                  child: Center(
                                    child: IconButton(
                                      icon: const Icon(
                                        Icons.search,
                                        color: Colors.white,
                                        size: 22,
                                      ),
                                      onPressed: () {
                                        Get.to(() => SearchPage());
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: height * 0.31,
                          ),
                          // Row(
                          //   mainAxisAlignment: MainAxisAlignment.center,
                          //   children: [
                          //     Flexible(
                          //       child: Text(
                          //         'Vote Count : ${findmovie.voteCount}',
                          //         style: GoogleFonts.manrope(
                          //             fontSize: 35,
                          //             fontWeight: FontWeight.w800,
                          //             color: Colors.white),
                          //         overflow: TextOverflow.ellipsis,
                          //       ),
                          //     ),
                          //   ],
                          // ),
                          const SizedBox(
                            height: 70,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                findmovie.title.toString(),
                                style: GoogleFonts.manrope(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                height: 35,
                                decoration: BoxDecoration(
                                    color: Colors.white12,
                                    borderRadius: BorderRadius.circular(12)),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    const Icon(
                                      Icons.star,
                                      color: Color(0xffffefb218),
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      'Rating  ${findmovie.voteAverage}',
                                      style: GoogleFonts.manrope(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                  ],
                                ),
                              ),
                              Text(
                                findmovie.originalLanguage.toString(),
                                style: GoogleFonts.manrope(
                                    color: Colors.grey.shade500,
                                    fontWeight: FontWeight.w500),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: 60,
                            decoration: BoxDecoration(
                                color: Colors.white12,
                                borderRadius: BorderRadius.circular(8)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "CONTINUE TO WATCH",
                                  style: GoogleFonts.manrope(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w800,
                                      fontSize: 20),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Text(
                            textAlign: TextAlign.justify,
                            findmovie.overview.toString(),
                            style: const TextStyle(fontSize: 17),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
