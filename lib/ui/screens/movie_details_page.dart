import 'package:flutter/material.dart';
import 'package:movies_app/resources/constants.dart';

import '../../model/api_model/movies/movies_list_response.dart';

class MovieDetailsPage extends StatelessWidget {
  final Movie movie;

  const MovieDetailsPage({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(movie.title!),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              height: MediaQuery.of(context).size.height * 0.45,
              child: Card(
                elevation: 5,
                shadowColor: Colors.black,
                child: Image.network(movie.largeCoverImage!),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(5),
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width * 0.45,
              child: Text(
                movie.title!,
                style: const TextStyle(
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            Text(
              "Year: " + movie.year.toString(),
              style: const TextStyle(
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              "Rating: " + movie.rating.toString(),
              style: const TextStyle(
                fontWeight: FontWeight.w500,
              ),
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              const Text(
                "Download ",
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Constants.themeGradients),
              ),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.download_outlined,
                      color: Constants.themeGradients)),
            ])
          ],
        ),
      ),
    );
  }
}
