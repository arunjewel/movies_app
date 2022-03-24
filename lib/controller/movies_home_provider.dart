import 'package:flutter/material.dart';

import '../core/config/api_config.dart';
import '../model/api_model/base_model/api_response.dart';
import '../model/api_model/movies/movies_list_response.dart';
import '../resources/urls.dart';

class MoviesHomeProvider extends ChangeNotifier {
  final ApiConfig apiConfig;

  MoviesHomeProvider({required this.apiConfig}) {
    getMoviesList();
  }
  bool loading = false;

  List<Movie> _moviesList = [];

  List<Movie> get moviesList => _moviesList;

  setLoading(bool value) {
    loading = value;
    notifyListeners();
  }

  getMoviesList() async {
    setLoading(true);
    if (_moviesList.isEmpty) {

      final testJsonData = {
        'limit': '5',
      };
      ApiResponse value = await apiConfig.getData(
          endpointUrl: Urls.moviesList, formData: testJsonData);

      if (value.response != null && value.response!.statusCode == 200) {
        print(value.response!.data!);
        MoviesListResponse movieData =
            MoviesListResponse.fromJson(value.response!.data!);
        _moviesList = movieData.data!.movies!;
        print(_moviesList.length);

      } else {
        // ScaffoldMessenger.of(context)
        //     .showSnackBar(SnackBar(content: Text(value.error.toString())));
        // : showErrorAlertBatch(context);
      }
      notifyListeners();
    }
    setLoading(false);
  }
}
