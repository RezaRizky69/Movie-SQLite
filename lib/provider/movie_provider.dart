import 'package:flutter/material.dart';
import 'package:flutter_crud/database/movie_database.dart';
import 'package:flutter_crud/model/movie.dart';

class MovieProvider with ChangeNotifier {
  late List<Movie> movie;

  int get movieCount {
    return movie.length;
  }

  void readAllMovies() {
    MovieDatabase.instance.readAllMovies().then((value) {
      movie = value;
      notifyListeners();
    });
  }

  void create(
      {String? title, String? director, String? summary, String? tags}) {
    MovieDatabase.instance.create(
        Movie(title: title, director: director, summary: summary, tags: tags));
    readAllMovies();
  }

  void readMovie(int id) {
    MovieDatabase.instance.readMovie(id);
    readAllMovies();
  }

  void update(
      {required int id,
      String? title,
      String? director,
      String? summary,
      String? tags}) {
    MovieDatabase.instance.update(Movie(
        id: id,
        title: title,
        director: director,
        summary: summary,
        tags: tags));
    readAllMovies();
  }

  void delete(int id) {
    MovieDatabase.instance.delete(id);
    readAllMovies();
  }
}
