import 'package:flutter/material.dart';
import 'package:flutter_voice/main.dart';
import 'package:splashscreen/splashscreen.dart';


class Splash2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 10,
      navigateAfterSeconds: new SpeechScreen(),
      title: new Text('Welcome',textScaleFactor: 2,),
      // image: new Image.network('https://www.geeksforgeeks.org/wp-content/uploads/gfg_200X200.png'),
      loadingText: Text("Loading"),
      photoSize: 100.0,
      loaderColor: Colors.blue,
    );
  }
}