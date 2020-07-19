import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:ytandmscsearcher/utils/yt_util.dart';

part 'yt_store.g.dart';

class YtStore = _YtStore with _$YtStore;

abstract class _YtStore with Store {
  _YtStore() {
    this.getPopularVideos();
  }

  @observable
  List<dynamic> videos;

  @observable
  String searchTerm = '';

  @observable
  bool isLoading = true;

  @observable
  bool isSearching = false;

  getPopularVideos() async {
    isLoading = true;
    videos = await YtUtil().getPopularVideos();
    isLoading = false;
  }

  getFilterVideos() async {
    isLoading = true;
    var teste = await YtUtil().getSearchedVideos(searchTerm);
    videos = teste;
    isLoading = false;
  }

  @action
  toggleLoading() {
    isLoading = !isLoading;
  }

  @action
  toggleSearching() {
    isSearching = !isSearching;
  }
}
