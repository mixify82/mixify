// genre_buttons.dart

import 'package:flutter/material.dart';

class GenreButtons extends StatelessWidget {
  final List<String> genres;
  final Function(String) onGenrePressed;

  const GenreButtons({super.key,
    required this.genres,
    required this.onGenrePressed,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: kToolbarHeight + 20.0,
      left: 0.0,
      right: 0.0,
      child: Container(
        height: 50.0,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              for (String genre in genres)
                buildGenreButton(genre),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildGenreButton(String genre) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: ElevatedButton(
        onPressed: () {
          onGenrePressed(genre);
        },
        style: ElevatedButton.styleFrom(
          primary: Colors.black,
          onPrimary: Colors.white,
          elevation: 4.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40.0),
          ),
        ),
        child: Text(genre),
      ),
    );
  }
}
