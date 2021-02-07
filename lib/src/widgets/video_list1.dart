import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:youtube_player_flutter/youtube_player_flutter.dart';

Widget buildListOfVideos(double h, double w, int length) {
  return Container(
    height: (w * 9 / 16 + 8) * length + 16,
    child: ListView.builder(
      padding: EdgeInsets.all(0),
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) => videoContainer(w, h, index),
      itemExtent: w * 9 / 16,
      primary: true,
      itemCount: length,
    ),
  );
}

YoutubePlayerController _controller = YoutubePlayerController(
  initialVideoId: YoutubePlayer.convertUrlToId("https://youtu.be/SmTCmDMi4BY"),
  flags: YoutubePlayerFlags(
      autoPlay: false,
      mute: false,
      isLive: false,
      disableDragSeek: false,
      forceHD: false,
      controlsVisibleAtStart: false),
);
videoContainer(double w, double h, int index) {
  return YoutubePlayer(
    width: w,
    controller: _controller,
    showVideoProgressIndicator: false,
    onReady: () {},
  );
}
