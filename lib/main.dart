import 'package:flutter/material.dart';
import 'package:movies_app/ui/screens/home_page.dart';
import 'package:provider/provider.dart';

import 'controller/movies_home_provider.dart';
import 'di_container.dart' as di;

void main() async{
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movies App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => di.sl<MoviesHomeProvider>(),
          ),
        ],
        child:const HomePage(),
      ),
    );
  }
}
