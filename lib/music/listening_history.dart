import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import "MusicAppBar.dart";
import 'AppNavigator.dart';
import 'FloatingButton.dart';

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
      drawer: AppNavigator.appDrawer(context),
      appBar: MusicAppBar.appBar("Listening History",context),
      backgroundColor: Colors.grey[900],
      floatingActionButton: FloatingButton.floatingButton(context),
    );
  }
}
