import 'package:flutter/material.dart';
import 'package:flutter_crud/database/movie_database.dart';
import 'package:flutter_crud/model/movie.dart';
import 'package:flutter_crud/screens/add_edit_movie_page.dart';
import 'package:flutter_crud/screens/movie_detail_page.dart';
import 'package:flutter_crud/widgets/movie_card_widget.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class MoviesPage extends StatefulWidget {
  @override
  _MoviesPageState createState() => _MoviesPageState();
}

class _MoviesPageState extends State<MoviesPage> {
  late List<Movie> movies;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();

    refreshMovies();
  }

  @override
  void dispose() {
    MovieDatabase.instance.close();

    super.dispose();
  }

  Future refreshMovies() async {
    setState(() => isLoading = true);

    this.movies = await MovieDatabase.instance.readAllMovies();

    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Movies",
          style: TextStyle(
            fontSize: 24,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.movie),
          ),
        ],
      ),
      body: Center(
        child: isLoading
            ? CircularProgressIndicator()
            : movies.isEmpty
                ? Text(
                    'No Movies Found\n Add Now',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.black26, fontSize: 24),
                  )
                : buildMovies(),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.orangeAccent,
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        onPressed: () async {
          await Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => AddEditMoviePage()),
          );

          refreshMovies();
        },
      ),
    );
  }

  Widget buildMovies() => StaggeredGridView.countBuilder(
        padding: EdgeInsets.all(8),
        itemCount: movies.length,
        mainAxisSpacing: 4,
        crossAxisSpacing: 4,
        crossAxisCount: 4,
        staggeredTileBuilder: (index) => StaggeredTile.fit(2),
        itemBuilder: (context, index) {
          final movie = movies[index];
          return GestureDetector(
            onTap: () async {
              await Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => MovieDetailPage(
                    movieId: movie.id,
                  ),
                ),
              );

              refreshMovies();
            },
            child: MovieCardWidget(movie: movie),
          );
        },
      );
}
