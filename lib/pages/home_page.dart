import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter/material.dart';
import 'package:ytandmscsearcher/store/tab_store.dart';
import 'package:ytandmscsearcher/store/yt_store.dart';

class HomePage extends StatelessWidget {
  HomePage({this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  Widget build(BuildContext context) {
    final ytStore = GetIt.instance.get<YtStore>();
    final tabStore = GetIt.instance.get<TabStore>();
    return Scaffold(
        appBar: AppBar(
          title: Observer(
            builder: (_) => !ytStore.isSearching
                ? Text(this.title)
                : Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                          labelText: 'Search',
                          focusColor: Theme.of(context).secondaryHeaderColor),
                      onChanged: (term) {
                        ytStore.searchTerm = term;
                      },
                    ),
                  ),
          ),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.search),
              tooltip: 'Search',
              onPressed: () {
                if (ytStore.searchTerm.trim() != '') {
                  ytStore.getFilterVideos();
                  return;
                }
                ytStore.toggleSearching();
              },
            )
          ],
        ),
        body: Observer(
            builder: (_) => Center(
                child:
                    tabStore.widgetOptions.elementAt(tabStore.selectedIndex))),
        bottomNavigationBar: Observer(
          builder: (_) => BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.youtube_searched_for),
                title: Text('Youtube'),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.music_note),
                title: Text('Music'),
              ),
            ],
            currentIndex: tabStore.selectedIndex,
            selectedItemColor: Colors.red,
            onTap: (index) => tabStore.onTap(index),
          ),
        ));
  }
}
