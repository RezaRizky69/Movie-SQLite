final String tableMovie = 'movies';

class MovieFields {
  static final List<String> values = [id, title, director, summary, tags];
  static final String id = '_id';
  static final String title = 'title';
  static final String director = 'director';
  static final String summary = 'summary';
  static final String tags = 'tags';
}

class Movie {
  final int? id;
  final String? title;
  final String? director;
  final String? summary;
  final String? tags;

  const Movie({this.id, this.title, this.director, this.summary, this.tags});

  Movie copy({
    int? id,
    String? title,
    String? director,
    String? summary,
    String? tags,
  }) =>
      Movie(
        id: id ?? this.id,
        title: title ?? this.title,
        director: director ?? this.director,
        summary: summary ?? this.summary,
        tags: tags ?? this.tags,
      );

  static Movie fromJson(Map<String, Object?> json) => Movie(
        id: json[MovieFields.id] as int?,
        title: json[MovieFields.title] as String?,
        director: json[MovieFields.director] as String?,
        summary: json[MovieFields.summary] as String?,
        tags: json[MovieFields.tags] as String?,
      );

  Map<String, Object?> toJson() => {
        MovieFields.id: id,
        MovieFields.title: title,
        MovieFields.director: director,
        MovieFields.summary: summary,
        MovieFields.tags: tags
      };
}
