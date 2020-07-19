import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:ytandmscsearcher/store/yt_store.dart';
import 'package:ytandmscsearcher/utils/yt_util.dart';
import 'package:ytandmscsearcher/widget/yt_list.dart';

part 'tab_store.g.dart';

class TabStore = _TabStore with _$TabStore;

abstract class _TabStore with Store {
  _TabStore() {}
  List<Widget> widgetOptions = <Widget>[
    Center(
      child: YtList(
        ytStore: GetIt.instance.get<YtStore>(),
      ),
    ),
    Text(
      'Index 1: Business',
    ),
  ];
  @observable
  int selectedIndex = 0;

  void onTap(index) {
    this.selectedIndex = index;
  }
}
