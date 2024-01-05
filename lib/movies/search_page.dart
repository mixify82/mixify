import 'package:flutter/material.dart';
import 'package:mixify/home.dart';
import 'package:mixify/movies/base_page.dart';
import 'package:mixify/movies/navigation_buttons.dart';
import 'package:flutter/services.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key});

  @override
  Widget build(BuildContext context) {
    // Set the status bar color to transparent
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
    ));

    return BasePage(
      pageTitle: 'Mixify Movies',
      body: const SearchContent(),
    );
  }
}

class SearchContent extends StatefulWidget {
  const SearchContent({super.key});

  @override
  _SearchContentState createState() => _SearchContentState();
}

class _SearchContentState extends State<SearchContent> {
  bool _isSearching = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Search bar
        Positioned(
          top: kToolbarHeight + 20.0,
          left: 16.0,
          right: 16.0,
          child: SearchBar(
            onTextChanged: (text) {
              setState(() {
                _isSearching = text.isNotEmpty;
              });
            },
          ),
        ),
        // Movie suggestions drawer
        if (_isSearching)
          Positioned(
            top: kToolbarHeight + 80.0,
            left: 16.0,
            right: 16.0,
            bottom: kToolbarHeight + 120.0,
            child: MovieSuggestionsDrawer(),
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
    );
  }
}

class SearchBar extends StatelessWidget {
  final Function(String) onTextChanged;

  const SearchBar({Key? key, required this.onTextChanged}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(40.0),
      ),
      child: TextField(
        onChanged: onTextChanged,
        decoration: InputDecoration(
          hintText: 'Search for movies...',
          border: InputBorder.none,
          icon: const Icon(Icons.search),
        ),
      ),
    );
  }
}

class MovieSuggestionsDrawer extends StatelessWidget {
  final List<String> suggestions = [
    'Movie not found :)',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[200], // Gray background color
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: ListView.builder(
        itemCount: suggestions.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(
              suggestions[index],
              style: TextStyle(color: Colors.grey[600]), // Light gray text color
            ),
            // Add thumbnail or additional information if needed
          );
        },
      ),
    );
  }
}
