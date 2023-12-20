import 'package:flutter/material.dart';
import "MusicAppBar.dart";
import 'FloatingButton.dart';
import 'package:flutter/services.dart';
import 'music_player.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'Songs.dart';

class LikedSongs extends StatefulWidget {
  const LikedSongs({super.key});

  @override
  State<LikedSongs> createState() => _LikedSongsState();
}

class _LikedSongsState extends State<LikedSongs> {
  _LikedSongsState() {
    for (int i = 0; i < Songs.songs.length; i++) {
      rows.add(
        TextButton(
          onPressed: (){
            Songs.songNumber=i;
            isPlaying=true;
            musicPlayer=MusicPlayer();
            setState(() {
              print(Songs.songNumber);
              print(isPlaying);
            });
          },
          child: Row(
            children: <Widget>[

              Image.asset(
                Songs.songs[i][1],
                width: 60,
                height: 60,
              ),
              const SizedBox(
                width: 40,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    Songs.songs[i][2],
                    style: const TextStyle(fontSize: 16, color: Colors.white60),
                  ),
                  const SizedBox(height: 10,),
                  Text(
                    Songs.songs[i][3],
                    style: const TextStyle(fontSize: 13, color: Colors.white60),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
      rows.add(
        Divider(height: 10,color: Colors.grey[800],)
      );
      likedSongs.add(Songs.songs[i][0]);
    }
    songCard = Column(
      children: rows,
    );
  }
  List<Widget> rows = <Widget>[];
  List<String> likedSongs=[];
  late Column songCard;

  MusicPlayer musicPlayer=MusicPlayer();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);

    return Scaffold(
        appBar: MusicAppBar.appBar("Liked Songs", context),
        floatingActionButton: FloatingButton.floatingButton(context),
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
          child: SlidingUpPanel(
            body: songCard,
            panel: musicPlayer,
            maxHeight: 800,
            minHeight: 80,
          ),
        ),
      );
  }
}

