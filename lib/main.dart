import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:audioplayers/audio_cache.dart';
import 'question.dart';


void main() {
  runApp(QuizApp());
}

class QuizApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home : Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Center(child: Text('Quiz')),
        ),
        body : MainBody(),
      ),
    );
  }
}

class MainBody extends StatefulWidget {
  @override
  _MainBodyState createState() => _MainBodyState();
}

class _MainBodyState extends State<MainBody> {
  AudioCache acache = AudioCache();
  AudioPlayer aplayer = AudioPlayer();
  AudioPlayerState  apstate = AudioPlayerState.STOPPED;
  @override
  void initState(){
    super.initState();
    acache = AudioCache(fixedPlayer: aplayer);
    aplayer.onPlayerStateChanged.listen((AudioPlayerState s) {
      setState(() {
        apstate =s;
      });
    });
  }

  @override
  void dispose(){
    super.dispose();
    aplayer.release();
    aplayer.dispose();
    acache.clearCache();
  }

  playsound(String path) async{
    await acache.play(path);
  }

  stopsound() async {
    await aplayer.stop();
  }

  int score =0;
  int queno=0;
  int r=0;
  List<Icon> icon = [];
  void press(bool b){
    setState(() {
      // print(queno);

        if (quebank[queno].ans == b) {
          icon.add(
              Icon(
                Icons.close,
                color: Colors.red,
              )
          );
        }
        else {
          icon.add(
              Icon(
                Icons.check,
                color: Colors.green,
              )
          );
          score++;
        }
        queno++;
        if(queno<quebank.length){
          stopsound();
          playsound('que$queno.wav');
        }
      if(queno>=quebank.length){
        Alert(
          context: context,
          title: 'Finished!',
          desc: 'You\'ve reached the end of the quiz.\n Your Score is $score',
        ).show();
        stopsound();
        playsound('Thank.wav');
        // player.clear('que14.wav');
        // player.play('Thank.wav');
        queno =0 ;
        r=0;
        score=0;
        icon =[];
      }

    });
  }

  @override
  Widget build(BuildContext context) {
    if(r==5) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[

          Expanded(
            flex: 5,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  quebank[queno].que,
                  style: TextStyle(
                    fontSize: 25.0,
                    color: Colors.white,
                  ),

                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: FlatButton(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                color: Colors.green,
                onPressed: () {
                  press(false);
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'True',
                    style: TextStyle(
                      fontSize: 25.0,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: FlatButton(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                color: Colors.red,
                onPressed: () {
                  press(true);
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'False',
                    style: TextStyle(
                      fontSize: 25.0,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Row(
            children: icon,
          ),
        ],
      );
    }
    else{
      return SafeArea(
        child : Center(
          child :FlatButton(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        color: Colors.orange,
        onPressed: (){
          setState(() {
            r =5;
            // player.play('que0.wav');
            playsound('que0.wav');
          });
        },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
          'Start',
          style: TextStyle(
              fontSize: 25.0,
              color: Colors.white,
          ),
        ),
            ),
      ),
        ),
      );
    }
  }
}

