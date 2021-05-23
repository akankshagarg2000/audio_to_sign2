
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoExample extends StatefulWidget {

String index;
VideoExample({this.index});

  @override
  VideoState createState() => VideoState();
}

class VideoState extends State<VideoExample> {
  bool _isListening = false;
  String _text = 'Press the button and start speaking';
  double _confidence = 1.0;
  VideoPlayerController playerController;
  VoidCallback listener;

  @override
  void initState() {
    super.initState();

    listener = () {
      setState(() {});
    };
    createVideo();
          playerController.play();
  }

  void createVideo() {
    if (playerController == null) {
      playerController = VideoPlayerController.network(
          "https://firebasestorage.googleapis.com/v0/b/audiotosign.appspot.com/o/sentences%2F"+ widget.index +".mp4?alt=media")
        ..addListener(listener)
        ..setVolume(1.0)
        ..initialize()
        ..play();
    } else {
      if (playerController.value.isPlaying) {
        playerController.pause();
      } else {
        playerController.initialize();
        playerController.play();
      }
    }
  }

  @override
  void deactivate() {
    playerController.setVolume(0.0);
    playerController.removeListener(listener);
    super.deactivate();
  }


   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Confidence: ${(_confidence * 100.0).toStringAsFixed(1)}%'),
      ),
      // appBar: AppBar(
      //   title: Text('Video Example'),
      // ),
      body: Center(
          child: AspectRatio(
              aspectRatio: 16 / 9,
              child: Container(
                child: (playerController != null
                    ? VideoPlayer(
                        playerController,
                      )
                    : Container()),
              ))),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     createVideo();
      //     playerController.play();
      //   },
      //   child: Icon(Icons.play_arrow),
      // ),
    );
  }
}