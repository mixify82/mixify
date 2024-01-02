import 'package:flutter/material.dart';
import 'listening_history.dart';
import 'recommendations.dart';
import 'liked_songs.dart';
import 'music_main.dart';

class MusicAppBar {



  static appBar(String appBarTitle) {

    return AppBar(
      title: Text(appBarTitle),
      centerTitle: true,
      backgroundColor: Colors.deepPurple,
      shadowColor: Colors.transparent,
      toolbarHeight: 50,
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(40),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: <Widget>[

              ElevatedButton(
                onPressed: () {
                  body=LikedSongs();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple[800],
                ),
                child: Container(
                  decoration: BoxDecoration(

                  ),
                  child: const Text(
                    "Liked Songs",
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  body=Recommendations();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple[800],
                ),
                child: const Text(
                  "Recommendations",
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  body=ListeningHistory();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple[800],
                ),
                child: const Text(
                  "Listening History",
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
