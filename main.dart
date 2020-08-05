import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:assign1/chewie.dart';
import 'package:video_player/video_player.dart';

void main() => runApp(MyApp());

AssetsAudioPlayer audioPlayer = AssetsAudioPlayer();

audioPlay() {
  var state = audioPlayer.currentPosition.value.toString();
  if (state == "0:00:00.000000") {
    audioPlayer.open(Audio("assets/audio/sound.mp3"));
  } else {
    audioPlayer.play();
  }
}

audioPause() {
  audioPlayer.pause();
}

audioStop() {
  audioPlayer.stop();
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Audio Video Player'),
          backgroundColor: Colors.grey,
        ),
        body: Column(
          children: <Widget>[
            Container(
              width: 350,
              height: 200,
              child: Card(
                color: Colors.white,
                child: Image.asset('images/wallpaper.jpg'),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: 100,
                  height: 50,
                  child: RaisedButton(
                    onPressed: () {
                      print('hi');
                      audioPlay();
                    },
                    child: Card(
                      color: Colors.green,
                      child: Icon(Icons.play_arrow),
                      elevation: 5,
                    ),
                  ),
                ),
                Container(
                  width: 100,
                  height: 50,
                  child: RaisedButton(
                    onPressed: () {
                      print('hi');
                      audioPause();
                    },
                    child: Card(
                      color: Colors.green,
                      child: Icon(Icons.pause),
                      elevation: 5,
                    ),
                  ),
                ),
                Container(
                  width: 100,
                  height: 50,
                  child: RaisedButton(
                    onPressed: () {
                      print('hi');
                      audioStop();
                    },
                    child: Card(
                      color: Colors.green,
                      child: Icon(Icons.stop),
                      elevation: 5,
                    ),
                  ),
                )
              ],
            ),
            Container(
              height: 50,
            ),
            Container(
              width: 300,
              height: 200,
              //color: Colors.red,
              decoration: BoxDecoration(
                border: Border.all(
                  width: 3,
                  color: Colors.grey,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: ChewieListItem(
                videoPlayerController: VideoPlayerController.network(
                    "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
