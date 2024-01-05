import 'package:flutter/material.dart';
import 'package:mixify/home.dart';
import 'package:mixify/movies/base_page.dart';
import 'package:mixify/movies/genre_buttons.dart';
import 'package:mixify/movies/navigation_buttons.dart';
import 'package:flutter/services.dart';
import 'package:mixify/movies/search_page.dart';

class MovieHomePage extends StatelessWidget {
  const MovieHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Set the status bar color to transparent
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
    ));

    return BasePage(
      pageTitle: 'Mixify Movies',
      body: Stack(
        children: [
          // Genre buttons
          GenreButtons(
            genres: const [
              'Action',
              'Comedy',
              'Romance',
              'High-School Romance',
              'Animation',
              'Anime',
              'K-Drama',
              'Drama',
              'Horror',
              // Add more genre buttons as needed
            ],
            onGenrePressed: (genre) {
              // Gonna put filtering logic here...
              print('Filter by $genre');
            },
          ),
          // Movie content
          const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Spacer
                SizedBox(height: 20.0),
                Text(
                  'No movies to show at the moment',
                  style: TextStyle(fontSize: 16.0),
                ),
              ],
            ),
          ),
          // Navigation buttons
          NavigationButtons(
            onHomePressed: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Home()),
              );
            },
            onSearchPressed: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SearchPage()),
              );
            },
            onFavoritesPressed: () {
              // Add navigation logic to go to the favorites page
            },
          ),
        ],
      ),
    );
  }
}
