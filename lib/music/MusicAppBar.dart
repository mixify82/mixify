import 'package:flutter/material.dart';
import 'listening_history.dart';
import 'recommendations.dart';
import 'liked_songs.dart';

class MusicAppBar {



  static appBar(String appBarTitle,BuildContext context) {

    return AppBar(
      title: Text(appBarTitle),
      centerTitle: true,
      backgroundColor: Colors.deepPurple,
      shadowColor: Colors.transparent,
      toolbarHeight: 70,
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(40),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: <Widget>[
              TextButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(Colors.transparent),
                ),
                onPressed: () {},
                child: const CircleAvatar(
                  backgroundImage: NetworkImage(
                    "https://cdn.vox-cdn.com/thumbor/PzidjXAPw5kMOXygTMEuhb634MM=/11x17:1898x1056/1200x800/filters:focal(807x387:1113x693)/cdn.vox-cdn.com/uploads/chorus_image/image/72921759/vlcsnap_2023_12_01_10h37m31s394.0.jpg",
                  ),
                ),
              ),
              Row(children: <Widget>[
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context)=>const LikedSongs())
                    );
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
                    Navigator.pop(context);
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context)=>const Recommendations())
                    );
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
                    Navigator.pop(context);
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context)=>const ListeningHistory())
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purple[800],
                  ),
                  child: const Text(
                    "Listening History",
                  ),
                ),

              ])
            ],
          ),
        ),
      ),
    );
  }
}
