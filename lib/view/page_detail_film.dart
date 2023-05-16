import '../controller/films_data_source.dart';
import '../model/details.dart';
import 'package:flutter/material.dart';

class PageDetailFilm extends StatefulWidget {
  final String text;
  const PageDetailFilm({Key? key, required this.text}) : super(key: key);
  @override
  State<PageDetailFilm> createState() => _PageDetailFilmState();
}

class _PageDetailFilmState extends State<PageDetailFilm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail Film"),
      ),
      body: _buildListUsersBody(),
    );
  }

  Widget _buildListUsersBody() {
    return Container(
      child: FutureBuilder(
        future: FilmsDataSource.instance.loadDetailFilm(widget.text),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasError) {
            // Jika data ada error maka akan ditampilkan hasil error
            return _buildErrorSection();
          }
          if (snapshot.hasData) {
            // Jika data ada dan berhasil maka akan ditampilkan hasil datanya
            FilmDetails filmsModel = FilmDetails.fromJson(snapshot.data);
            return _buildSuccessSection(filmsModel);
          }
          return _buildLoadingSection();
        },
      ),
    );
  }

  Widget _buildErrorSection() {
    return Text("Error");
  }

  Widget _buildLoadingSection() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildSuccessSection(FilmDetails data) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(top: 15),
          //bisa di slide
          child: Container(
            height: MediaQuery.of(context).size.height / 3,
            child: Image.network(data.poster!),
          ),
        ),
        Container(
          child: Text(
            data.title!,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.90,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: 3, top: 25, left: 50),
                child: Text("Date Released :  ${data.released!}"),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 3, left: 50),
                child: Text("Genre :  ${data.genre!}"),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 3, left: 50),
                child: Text("Director :  ${data.director!}"),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 3, left: 50),
                child: Text("Actor :  ${data.actors!}"),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 3, left: 50),
                child: Text("Plot : "),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 3, left: 50),
                child: Text(data.plot!),
              )
            ],
          ),
        ),
      ],
    );
  }
}
