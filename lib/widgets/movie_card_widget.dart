import 'package:flutter/material.dart';
import 'package:flutter_crud/model/movie.dart';

class MovieCardWidget extends StatelessWidget {
  const MovieCardWidget({Key? key, this.movie}) : super(key: key);

  final Movie? movie;

  @override
  Widget build(BuildContext context) {
    return Card(
      // color: Colors.orangeAccent,
      child: Container(
        constraints: BoxConstraints(minHeight: 150.0),
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
            color: Colors.orangeAccent,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 23),
                blurRadius: 20.0,
                color: Colors.black.withOpacity(0.25),
              ),
            ]),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Movie : ${movie!.title!}",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 4),
            Text(
              "Director : ${movie!.director!}",
              style: TextStyle(
                color: Colors.black,
                fontSize: 12,
              ),
            ),
            SizedBox(height: 2),
            Text(
              "Summary : ${movie!.summary!}",
              style: TextStyle(
                color: Colors.black,
                fontSize: 8,
              ),
            ),
            SizedBox(height: 8),
            Text(
              "Tags : ${movie!.tags!}",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 8,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
