import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:ytandmscsearcher/models/ytseach_model.dart';
import 'package:googleapis/youtube/v3.dart' as youtube;
import 'package:ytandmscsearcher/pages/video_visualizer_page.dart';
import 'package:ytandmscsearcher/widget/yt_card.dart';

class YtList extends StatelessWidget {
  YtList({this.ytStore});
  final ytStore;

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      if (ytStore.isLoading) {
        return Center(
          child: CircularProgressIndicator(
            backgroundColor: Colors.amber,
          ),
        );
      }
      if (ytStore.videos.length <= 0) {
        return Center(child: Text("Não tem nada aqui"));
      }

      return GridView.builder(
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemCount: ytStore.videos.length,
          itemBuilder: (BuildContext ctx, int index) {
            var ytVideo;
            if (ytStore.videos[index]['id'] is Map<String, dynamic>) {
              ytVideo = YtSearchModel.fromJson(ytStore.videos[index]);
            } else {
              ytVideo = youtube.Video.fromJson(ytStore.videos[index]);
            }
            return GestureDetector(
                child: Center(child: YtCard(content: ytVideo)),
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => VideoVisualizerPage(
                            title: ytVideo.snippet.title,
                            id: ytVideo is YtSearchModel
                                ? ytVideo.videoId
                                : ytVideo.id,
                            video: ytVideo))));
          });
    });
  }
}
