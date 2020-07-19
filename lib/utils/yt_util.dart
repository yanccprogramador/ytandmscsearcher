//import 'package:googleapis/youtube/v3.dart' as youtube;
import './request_util.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class YtUtil {
  Future<List<dynamic>> getPopularVideos() async {
    var resp = await RequestUtil().get(
        'https://www.googleapis.com/youtube/v3/videos?maxResults=12&part=snippet&chart=mostPopular&regionCode=BR&videoCategoryId=17&key=${DotEnv().env['YT_KEY']}');
    return resp['items'];
  }

  Future<List<dynamic>> getSearchedVideos(term) async {
    var resp = await RequestUtil().get(
        'https://www.googleapis.com/youtube/v3/search?q=${term}&maxResults=12&part=snippet,id&key=${DotEnv().env['YT_KEY']}');
    return resp['items'];
  }
}
