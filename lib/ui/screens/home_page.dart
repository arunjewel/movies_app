import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../controller/movies_home_provider.dart';
import '../widgets/network_loading.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Consumer<MoviesHomeProvider>(
      builder: (_, feedsVm, __) => feedsVm.loading
          ? NetworkLoading()
          : Center(
              child: ListView.builder(
                  itemCount: feedsVm.moviesList.length,
                  itemBuilder: (context, index) => Container(
                        alignment: Alignment.center,
                        child: Text(feedsVm.moviesList[index].title!),
                      ))),
    ));
  }
}
