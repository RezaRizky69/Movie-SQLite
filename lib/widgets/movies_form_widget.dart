import 'package:flutter/material.dart';

class MovieFormWidget extends StatefulWidget {
  final String? title;
  final String? director;
  final String? summary;
  final String? tags;
  final ValueChanged<String> onChangedTitle;
  final ValueChanged<String> onChangedDirector;
  final ValueChanged<String> onChangedSummary;
  final ValueChanged<String> onChangedTags;

  const MovieFormWidget(
      {Key? key,
      this.title = '',
      this.director = '',
      this.summary = '',
      this.tags = '',
      required this.onChangedTitle,
      required this.onChangedDirector,
      required this.onChangedSummary,
      required this.onChangedTags})
      : super(key: key);

  @override
  _MovieFormWidgetState createState() => _MovieFormWidgetState();
}

class _MovieFormWidgetState extends State<MovieFormWidget> {
  // String? dropdownValue = 'Action';

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              buildTitle(),
              SizedBox(height: 8),
              buildDirector(),
              SizedBox(height: 2),
              buildSummary(),
              SizedBox(height: 8),
              buildTags(),
              SizedBox(height: 2),
            ],
          ),
        ),
      );

  Widget buildTitle() => TextFormField(
        maxLines: 1,
        initialValue: widget.title,
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 24,
        ),
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: 'Enter your movie title..',
          hintStyle: TextStyle(color: Colors.black26),
        ),
        validator: (title) =>
            title != null && title.isEmpty ? 'The title cannot be empty' : null,
        onChanged: widget.onChangedTitle,
      );

  Widget buildDirector() => TextFormField(
        maxLines: 1,
        initialValue: widget.director,
        style: TextStyle(
          color: Colors.black,
          fontSize: 18,
        ),
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: 'Enter your movie director..',
          hintStyle: TextStyle(color: Colors.black26),
        ),
        validator: (director) => director != null && director.isEmpty
            ? 'The director cannot be empty'
            : null,
        onChanged: widget.onChangedDirector,
      );

  Widget buildSummary() => TextFormField(
        maxLines: 10,
        initialValue: widget.summary,
        style: TextStyle(color: Colors.black, fontSize: 18),
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: 'The Summary is..',
          hintStyle: TextStyle(color: Colors.black26),
        ),
        validator: (summary) => summary != null && summary.isEmpty
            ? 'The summary cannot be empty'
            : null,
        onChanged: widget.onChangedSummary,
      );

  Widget buildTags() => TextFormField(
        maxLines: 1,
        initialValue: widget.tags,
        style: TextStyle(
          color: Colors.black,
          fontSize: 18,
        ),
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: 'Enter your movie tags..',
          hintStyle: TextStyle(color: Colors.black26),
        ),
        validator: (tags) =>
            tags != null && tags.isEmpty ? 'The tags cannot be empty' : null,
        onChanged: widget.onChangedTags,
      );

  // Widget buildTag() => Container(
  //       height: 60.0,
  //       width: 200.0,
  //       padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 5.0),
  //       margin: EdgeInsets.only(right: 120.0),
  //       decoration: BoxDecoration(
  //         color: Colors.white,
  //         border: Border.all(color: Colors.black87, width: 2),
  //         borderRadius: BorderRadius.circular(20),
  //       ),
  //       child: DropdownButton<String>(
  //         isExpanded: true,
  //         value: dropdownValue,
  //         icon: const Icon(Icons.arrow_downward_sharp),
  //         iconSize: 16,
  //         elevation: 16,
  //         style: const TextStyle(color: Colors.black),
  //         onChanged: (String? newValue) {
  //           setState(() {
  //             dropdownValue = newValue!;
  //             newValue = widget.onChangedTags as String?;
  //           });
  //         },
  //         items: <String>[
  //           'Action',
  //           'Fantasy',
  //           'Comedy',
  //           'Sci-fi',
  //           'Horror',
  //         ].map<DropdownMenuItem<String>>((String value) {
  //           return DropdownMenuItem<String>(
  //             value: value,
  //             child: Text(value),
  //           );
  //         }).toList(),
  //       ),
  //     );
}
