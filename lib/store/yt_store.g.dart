// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'yt_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$YtStore on _YtStore, Store {
  final _$videosAtom = Atom(name: '_YtStore.videos');

  @override
  List<dynamic> get videos {
    _$videosAtom.reportRead();
    return super.videos;
  }

  @override
  set videos(List<dynamic> value) {
    _$videosAtom.reportWrite(value, super.videos, () {
      super.videos = value;
    });
  }

  final _$searchTermAtom = Atom(name: '_YtStore.searchTerm');

  @override
  String get searchTerm {
    _$searchTermAtom.reportRead();
    return super.searchTerm;
  }

  @override
  set searchTerm(String value) {
    _$searchTermAtom.reportWrite(value, super.searchTerm, () {
      super.searchTerm = value;
    });
  }

  final _$isLoadingAtom = Atom(name: '_YtStore.isLoading');

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  final _$isSearchingAtom = Atom(name: '_YtStore.isSearching');

  @override
  bool get isSearching {
    _$isSearchingAtom.reportRead();
    return super.isSearching;
  }

  @override
  set isSearching(bool value) {
    _$isSearchingAtom.reportWrite(value, super.isSearching, () {
      super.isSearching = value;
    });
  }

  final _$_YtStoreActionController = ActionController(name: '_YtStore');

  @override
  dynamic toggleLoading() {
    final _$actionInfo =
        _$_YtStoreActionController.startAction(name: '_YtStore.toggleLoading');
    try {
      return super.toggleLoading();
    } finally {
      _$_YtStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic toggleSearching() {
    final _$actionInfo = _$_YtStoreActionController.startAction(
        name: '_YtStore.toggleSearching');
    try {
      return super.toggleSearching();
    } finally {
      _$_YtStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
videos: ${videos},
searchTerm: ${searchTerm},
isLoading: ${isLoading},
isSearching: ${isSearching}
    ''';
  }
}
