import 'package:flutter/material.dart';

class NavigationButtons extends StatelessWidget {
  final VoidCallback onHomePressed;
  final VoidCallback onSearchPressed;
  final VoidCallback onFavoritesPressed;

  NavigationButtons({
    required this.onHomePressed,
    required this.onSearchPressed,
    required this.onFavoritesPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 60.0,
      left: 40.0,
      right: 40.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: Icon(
              Icons.home,
              color: Colors.white,
            ),
            onPressed: onHomePressed,
          ),
          IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.white,
            ),
            onPressed: onSearchPressed,
          ),
          IconButton(
            icon: Icon(
              Icons.favorite,
              color: Colors.white,
            ),
            onPressed: onFavoritesPressed,
          ),
        ],
      ),
    );
  }
}
