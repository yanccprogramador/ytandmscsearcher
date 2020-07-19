import 'package:get_it/get_it.dart';
import 'package:ytandmscsearcher/store/tab_store.dart';
import '../store/yt_store.dart';

class Dependencies {
  static registerDependencies() {
    GetIt getIt = GetIt.I;
    getIt.reset();

    getIt.registerLazySingleton<YtStore>(
      () => YtStore(),
    );
    getIt.registerLazySingleton<TabStore>(
      () => TabStore(),
    );
  }
}
