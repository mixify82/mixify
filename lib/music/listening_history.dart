import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import "MusicAppBar.dart";
import 'AppNavigator.dart';
import 'FloatingButton.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class ListeningHistory extends StatefulWidget {
  const ListeningHistory({super.key});

  @override
  State<ListeningHistory> createState() => _ListeningHistoryState();
}

class _ListeningHistoryState extends State<ListeningHistory> {

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.deepPurple,
              Colors.black,
            ],
          ),
        ),
      ),

    );
  }
}
