import 'package:flutter/material.dart';

import '../../model/api_model/movies/movies_list_response.dart';
class MovieCardWidget extends StatelessWidget {
  final Movie movie;

  const MovieCardWidget({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          height: MediaQuery.of(context).size.height * 0.25,
          child: Card(
            elevation: 5,
            shadowColor: Colors.black,
            child: Image.network(movie.largeCoverImage!),
          ),
        ),
        Container(
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width * 0.45,
          child: Text(
            movie.title!,
            style: const TextStyle(
              fontWeight: FontWeight.w700,
            ),
          ),
        )
      ],
    );
  }
}
