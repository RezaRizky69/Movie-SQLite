import 'package:flutter/material.dart';
import 'package:flutter_crud/database/movie_database.dart';
import 'package:flutter_crud/model/movie.dart';
import 'package:flutter_crud/screens/add_edit_movie_page.dart';

class MovieDetailPage extends StatefulWidget {
  final int? movieId;

  const MovieDetailPage({Key? key, this.movieId}) : super(key: key);
  @override
  _MovieDetailPageState createState() => _MovieDetailPageState();
}

class _MovieDetailPageState extends State<MovieDetailPage> {
  Movie? movie;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();

    refreshMovie();
  }

  Future refreshMovie() async {
    setState(() => isLoading = true);

    this.movie = await MovieDatabase.instance.readMovie(widget.movieId);

    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [editButton(), deleteButton()],
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : Padding(
              padding: EdgeInsets.all(12),
              child: ListView(
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                children: [
                  Text(
                    movie!.title!,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    movie!.director!,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    movie!.summary!,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    movie!.tags!,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
    );
  }

  Widget editButton() => IconButton(
      icon: Icon(Icons.edit_outlined),
      onPressed: () async {
        if (isLoading) return;

        await Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => AddEditMoviePage(movie: movie),
        ));

        refreshMovie();
      });

  Widget deleteButton() => IconButton(
        icon: Icon(Icons.delete),
        onPressed: () async {
          await MovieDatabase.instance.delete(widget.movieId);

          Navigator.of(context).pop();
        },
      );
}
