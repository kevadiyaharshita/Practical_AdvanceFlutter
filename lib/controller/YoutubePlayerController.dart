import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YoutubeVideoController extends ChangeNotifier {
  late YoutubePlayerController _controller;

  YoutubePlayerController intit_Controller({required String id}) {
    _controller = YoutubePlayerController(
      initialVideoId: id,
      flags: YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
      ),
    );

    return _controller;
  }

  get getContoller {
    _controller.toggleFullScreenMode();
    return _controller.toggleFullScreenMode();
    ;
  }
}
