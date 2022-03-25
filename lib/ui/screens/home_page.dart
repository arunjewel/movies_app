import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../controller/movies_home_provider.dart';
import '../../model/api_model/movies/movies_list_response.dart';
import '../../resources/text_constants.dart';
import '../widgets/network_loading.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:const Text("Movies Hub"),),
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
                      return MovieCardWidget(
                        movie: feedsVm.moviesList[index],
                      );
                    },
                  ),
                ),
    ));
  }
}

class MovieCardWidget extends StatelessWidget {
  final Movie movie;

  const MovieCardWidget({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.25,
          child: Image.network(movie.largeCoverImage!),
        ),
        Text(movie.title!),
      ],
    );
  }
}
