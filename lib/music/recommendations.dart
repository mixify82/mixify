import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import "MusicAppBar.dart";
import 'AppNavigator.dart';
import 'FloatingButton.dart';

class Recommendations extends StatefulWidget {
  const Recommendations({super.key});

  @override
  State<Recommendations> createState() => _RecommendationsState();
}

class _RecommendationsState extends State<Recommendations> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);

    return Scaffold(
      drawer: AppNavigator.appDrawer(context),
      appBar: MusicAppBar.appBar("Recommendations",context),
      backgroundColor: Colors.grey[900],
      floatingActionButton: FloatingButton.floatingButton(context),
    );
  }
}
