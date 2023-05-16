import 'package:datafilm_omdb/view/page_list_film.dart';
import 'package:datafilm_omdb/view/page_search_film.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'OMDB FILM',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        colorScheme: ColorScheme.light().copyWith(primary: Colors.tealAccent),
      ),
      home: PageSearchFilm(),
    );
  }
}
