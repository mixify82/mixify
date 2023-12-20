import 'package:audioplayers/audioplayers.dart';
import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:math';
import 'Songs.dart';

bool shuffle = false;
bool isPlaying=false;

class MusicPlayer extends StatefulWidget {
  const MusicPlayer({super.key});


  @override
  State<MusicPlayer> createState() => _MusicPlayerState();
}

class _MusicPlayerState extends State<MusicPlayer> {
  _MusicPlayerState() {
    //playSong();
    audioPlayer.pause();
    for(int i=0;i<Songs.songs.length;i++){
      randomSongs.add(Songs.songs[i]);
    }
    init();
    print(currentSong);
  }

  AudioPlayer audioPlayer = AudioPlayer();
  String currentSong = "success-1-6297.mp3";

  void playSong() async {
    //await audioPlayer.pause();
    await audioPlayer.play(AssetSource(currentSong));
  }



  //final
  Duration duration = Duration.zero;
  Duration position = Duration.zero;

  late List<List<String>> randomSongs=[];
  int songNumber = 0;
  bool loop = false;

  void init() async {
    await audioPlayer.pause();
    setState(() {
      //duration=Duration.zero;
      //position=Duration.zero;
      if (loop)
        audioPlayer.setReleaseMode(ReleaseMode.loop);
      else
        audioPlayer.setReleaseMode(ReleaseMode.release);
      if (songNumber < 0)
        songNumber = Songs.songs.length - 1;
      else if (songNumber > Songs.songs.length - 1) songNumber = 0;
      if (!shuffle)
        currentSong = Songs.songs[songNumber][0];
      else
        currentSong = randomSongs[songNumber][0];
    });
    if(isPlaying)playSong();
  }

  void initState() {
    super.initState();

    audioPlayer.onPlayerStateChanged.listen((state) {
      setState(() {
        isPlaying = state == PlayerState.playing;
      });
    });

    audioPlayer.onDurationChanged.listen((newDuration) {
      setState(() {
        duration = newDuration;
      });
    });

    audioPlayer.onPositionChanged.listen((newPosition) {
      setState(() {
        if (newPosition.inSeconds == duration.inSeconds) {
          if (!loop) songNumber++;
          init();
        }
        position = newPosition;
        if (!shuffle)
          currentSong = Songs.songs[songNumber][0];
        else
          currentSong = randomSongs[songNumber][0];
      });
    });
  }

  void randomize() {
    Random random = Random();
    for (int i = 0; i < Songs.songs.length; i++) {
      int a = random.nextInt(Songs.songs.length);
      int b = random.nextInt(Songs.songs.length);
      List<String> temp = randomSongs[a];
      randomSongs[a] = randomSongs[b];
      randomSongs[b] = temp;
    }
    setState(() {
      for (int i = 0; i < Songs.songs.length; i++) {
        if(DeepCollectionEquality().equals(randomSongs[i], Songs.songs[songNumber])==true){
          print("Yes");
          songNumber=i;
          break;
        }
      }
    });
  }

  void derandomize() {
    setState(() {
      for (int i = 0; i < Songs.songs.length; i++) {
        if(listEquals(Songs.songs[i], randomSongs[songNumber])){
          songNumber=i;
          break;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[850],
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  shuffle ? randomSongs[songNumber][1] : Songs.songs[songNumber][1],
                  width: double.infinity,
                  height: 350,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                shuffle ? randomSongs[songNumber][2] : Songs.songs[songNumber][2],
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                shuffle ? randomSongs[songNumber][3] : Songs.songs[songNumber][3],
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey[600],
                ),
              ),
              Slider(
                min: 0,
                max: duration.inSeconds.toDouble(),
                value: position.inSeconds.toDouble(),
                activeColor: Colors.purple[700],
                inactiveColor: Colors.purple[200],
                onChanged: (value) async {
                  final position = Duration(seconds: value.toInt());
                  await audioPlayer.seek(position);
                  //await audioPlayer.resume();
                },
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      DateFormat('mm:ss').format(
                          DateTime.fromMillisecondsSinceEpoch(
                              position.inMilliseconds)),
                      style: TextStyle(color: Colors.white),
                    ),
                    Text(
                      DateFormat('mm:ss').format(
                          DateTime.fromMillisecondsSinceEpoch(
                              (duration).inMilliseconds)),
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.shuffle_outlined,
                      color: shuffle ? Colors.purple[700] : Colors.grey,
                    ),
                    onPressed: () {
                      if (shuffle) {
                        shuffle = false;
                        derandomize();
                      } else {
                        shuffle = true;
                        randomize();
                      }
                    },
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.skip_previous,
                      color: Colors.grey,
                    ),
                    iconSize: 30,
                    onPressed: () {
                      songNumber--;
                      loop = false;
                      init();
                    },
                  ),
                  CircleAvatar(
                    child: Center(
                      child: IconButton(
                        onPressed: () async {
                          if (isPlaying)
                            await audioPlayer.pause();
                          else
                            playSong();
                        },
                        icon: Icon(
                          isPlaying ? Icons.pause : Icons.play_arrow,
                          color: Colors.white,
                        ),
                        iconSize: 40,
                      ),
                    ),
                    radius: 30,
                    backgroundColor: Colors.purple[700],
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.skip_next,
                      color: Colors.grey,
                    ),
                    iconSize: 30,
                    onPressed: () {
                      songNumber++;
                      loop = false;
                      init();
                    },
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.loop_outlined,
                      color: loop ? Colors.purple[700] : Colors.grey,
                    ),
                    onPressed: () {
                      setState(() {
                        if (loop)
                          loop = false;
                        else
                          loop = true;
                      });
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}