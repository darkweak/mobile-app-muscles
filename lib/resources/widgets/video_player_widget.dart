import 'package:nylo_framework/nylo_framework.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter/material.dart';

class VideoPlayerWidget extends StatefulWidget {
  const VideoPlayerWidget({
    required this.heroAnimation,
    required this.url,
    Key? key,
  }) : super(key: key);

  final Animation<double> heroAnimation;
  final String url;

  @override
  _VideoPlayerWidgetState createState() =>
      _VideoPlayerWidgetState(heroAnimation: heroAnimation);
}

class _VideoPlayerWidgetState extends NyState<VideoPlayerWidget> {
  _VideoPlayerWidgetState({required this.heroAnimation});

  final Animation<double> heroAnimation;
  late VideoPlayerController _controller;

  @override
  void initState() {
    var url = this.widget.url;
    var callback = url.startsWith('http')
        ? VideoPlayerController.network(url)
        : VideoPlayerController.asset(getPublicAsset(url));

    _controller = callback
      ..initialize()
      ..setLooping(true);
    super.initState();
  }

  double get playButtonSize => 50 + 50 * heroAnimation.value;

  @override
  Widget build(BuildContext context) {
    print(_controller.value);
    return GestureDetector(
      onTap: () {
        var tmpController = _controller;
        if (tmpController.value.isPlaying) {
          tmpController.pause();
        } else {
          tmpController.play();
        }
        this.setState(() {
          _controller = tmpController;
        });
      },
      child: Stack(
        alignment: Alignment.center,
        children: [
          VideoPlayer(_controller),
          Padding(
            padding:
                const EdgeInsets.only(bottom: 45) * (1 - heroAnimation.value),
            child: _controller.value.isPlaying
                ? null
                : Container(
                    height: playButtonSize,
                    width: playButtonSize,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.black38,
                    ),
                    alignment: Alignment.center,
                    child: Icon(Icons.play_arrow,
                        size: playButtonSize, color: Colors.white70),
                  ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
