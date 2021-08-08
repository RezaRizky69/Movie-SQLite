import 'package:flutter/material.dart';
import 'package:flutter_crud/database/movie_database.dart';
import 'package:flutter_crud/model/movie.dart';
import 'package:flutter_crud/widgets/movies_form_widget.dart';

class AddEditMoviePage extends StatefulWidget {
  final Movie? movie;

  const AddEditMoviePage({Key? key, this.movie}) : super(key: key);
  @override
  _AddEditMoviePageState createState() => _AddEditMoviePageState();
}

class _AddEditMoviePageState extends State<AddEditMoviePage> {
  final _formKey = GlobalKey<FormState>();
  String? title;
  String? director;
  String? summary;
  String? tags;

  @override
  void initState() {
    super.initState();

    title = widget.movie?.title ?? '';
    director = widget.movie?.director ?? '';
    summary = widget.movie?.summary ?? '';
    tags = widget.movie?.tags ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [buildButton()],
      ),
      body: Form(
        key: _formKey,
        child: MovieFormWidget(
          title: title,
          director: director,
          summary: summary,
          tags: tags,
          onChangedTitle: (title) => setState(() => this.title = title),
          onChangedDirector: (director) =>
              setState(() => this.director = director),
          onChangedSummary: (summary) => setState(() => this.summary = summary),
          onChangedTags: (tags) => setState(() => this.tags = tags),
        ),
      ),
    );
  }

  Widget buildButton() {
    final isFormValid = title!.isNotEmpty &&
        director!.isNotEmpty &&
        summary!.isNotEmpty &&
        tags!.isNotEmpty;

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          onPrimary: Colors.white,
          primary: isFormValid ? Colors.orange : Colors.black26,
        ),
        onPressed: addOrUpdateMovie,
        child: Text('Save'),
      ),
    );
  }

  void addOrUpdateMovie() async {
    final isValid = _formKey.currentState!.validate();

    if (isValid) {
      final isUpdating = widget.movie != null;

      if (isUpdating) {
        await updateMovie();
      } else {
        await addMovie();
      }

      Navigator.of(context).pop();
    }
  }

  Future updateMovie() async {
    final movie = widget.movie!.copy(
      title: title,
      director: director,
      summary: summary,
      tags: tags,
    );

    await MovieDatabase.instance.update(movie);
  }

  Future addMovie() async {
    final movie = Movie(
      title: title,
      director: director,
      summary: summary,
      tags: tags,
    );

    await MovieDatabase.instance.create(movie);
  }
}
