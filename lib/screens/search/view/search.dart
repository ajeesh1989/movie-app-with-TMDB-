import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:reel_time/image/image.dart';
import 'package:reel_time/screens/search/controller/search_controller.dart';
import 'package:reel_time/screens/search/service/search_service.dart';

import '../../moviedetails/view/movie_details.dart';

class SearchPage extends StatelessWidget {
  SearchPage({super.key});
  SearchController searchController = Get.put(SearchController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SearchController>(
      builder: (controller) => Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          title: Text("Search your favourite movie"),
          backgroundColor: Colors.black,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              CupertinoSearchTextField(
                controller: searchController.textEditingController,
                style: const TextStyle(color: Colors.white54),
                autocorrect: true,
                backgroundColor: Colors.white12,
                autofocus: true,
                onChanged: (value) {
                  searchController.getMovieList(value);
                },
              ),
              Expanded(
                child: searchController.searchList.length == 0
                    ? CircularProgressIndicator()
                    : ListView.builder(
                        shrinkWrap: true,
                        itemCount:
                            searchController.searchList[0].results.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () => Get.to(DetailPage(
                              id: searchController
                                  .searchList[0].results[index].id,
                            )),
                            child: ListTile(
                              leading: Image.network(
                                  '${ImageUrl().imageAppUrl}${searchController.searchList[0].results[index].posterPath}'),
                              title: Text(searchController
                                  .searchList[0].results[index].originalTitle),
                            ),
                          );
                        },
                      ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
