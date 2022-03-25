import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../controller/movies_home_provider.dart';
import '../../resources/text_constants.dart';
import '../../resources/utils.dart';
import '../widgets/network_loading.dart';
import 'movie_card_widget.dart';
import 'movie_details_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Movies Hub"),
        ),
        body: Consumer<MoviesHomeProvider>(
          builder: (_, feedsVm, __) => feedsVm.loading
              ? const NetworkLoading()
              : feedsVm.moviesList.isEmpty
                  ? const Center(
                      child: Text(noMovies),
                    )
                  : Center(
                      child: GridView.builder(
                        itemCount: feedsVm.moviesList.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2),
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                              onTap: () {
                                toPage(
                                    context,
                                    MovieDetailsPage(
                                      movie: feedsVm.moviesList[index],
                                    ));
                              },
                              child: MovieCardWidget(
                                movie: feedsVm.moviesList[index],
                              ));
                        },
                      ),
                    ),
        ));
  }
}
