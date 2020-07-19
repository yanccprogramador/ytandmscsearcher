import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:googleapis/youtube/v3.dart' as youtube;

class VideoVisualizerPage extends StatelessWidget {
  VideoVisualizerPage({this.title, id, this.video})
      : _controller = YoutubePlayerController(
          initialVideoId: YoutubePlayer.convertUrlToId(
              "https://www.youtube.com/watch?v=${id}"),
          flags: YoutubePlayerFlags(
            autoPlay: true,
            mute: false,
          ),
        );

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;
  String id;
  var video;
  YoutubePlayerController _controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(this.title),
        ),
        body: Container(
          child: Column(
            children: <Widget>[
              YoutubePlayer(
                controller: _controller,
                showVideoProgressIndicator: true,
              ),
              Text(
                video.snippet.title,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text(video.snippet.description),
            ],
          ),
        ));
  }
}
