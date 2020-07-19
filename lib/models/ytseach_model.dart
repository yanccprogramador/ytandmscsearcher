import 'package:googleapis/youtube/v3.dart';

class YtSearchModel {
  String kind;
  String etag;
  Map<String, dynamic> id;
  String videoId;
  VideoSnippet snippet;
  YtSearchModel.fromJson(Map<String, dynamic> _json) {
    kind = _json['kind'];
    etag = _json['etag'];
    id = _json['id'];
    videoId = _json['id']['videoId'];
    snippet = VideoSnippet.fromJson(_json['snippet']);
  }
}
