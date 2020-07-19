import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:googleapis/dfareporting/v3_4.dart';
import 'package:googleapis/youtube/v3.dart' as yt;

class YtCard extends StatelessWidget {
  YtCard({content}) : content = content;
  var content;
  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 0.5,
        child: Container(
          child: Column(
            children: <Widget>[
              Image.network(
                content.snippet.thumbnails.high.url,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 1.25),
                  child: Wrap(
                    direction: Axis.vertical,
                    children: <Widget>[
                      Container(
                        width: MediaQuery.of(context).size.width / 2,
                        child: Text(
                          content.snippet.title.substring(
                                  0,
                                  content.snippet.title.length > 30
                                      ? 30
                                      : content.snippet.title.length) +
                              '...',
                          overflow: TextOverflow.visible,
                          maxLines: 5,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
