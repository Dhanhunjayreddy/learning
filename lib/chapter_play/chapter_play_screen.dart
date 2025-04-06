import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:video_player/video_player.dart';
import 'package:universal_html/html.dart' as html;

class ChapterPlayScreen extends StatefulWidget {
  const ChapterPlayScreen({super.key});

  @override
  State<ChapterPlayScreen> createState() => _ChapterPlayScreenState();
}

class _ChapterPlayScreenState extends State<ChapterPlayScreen> {
  late VideoPlayerController _controller;
  bool _isFullScreen = false;

  @override
  void initState() {
    super.initState();
    try {
      _controller =
          VideoPlayerController.networkUrl(
              Uri.parse(
                'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4',
              ),
            )
            ..addListener(() {
              setState(() {});
            })
            ..initialize().then((_) {
              // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
              setState(() {});
            });
    } catch (e) {
      print('exception catched $e');
    }

    // _controller.play();
  }

  void _toggleFullScreen() {
    if (kIsWeb) {
      html.window.document.documentElement?.requestFullscreen();
    } else {
      _enterFullScreenMobile();
    }
  }

  void _enterFullScreenMobile() {
    setState(() {
      _isFullScreen = !_isFullScreen;
    });

    if (_isFullScreen) {
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    } else {
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    if (!kIsWeb) {
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:
            _controller.value.isInitialized
                ? AspectRatio(
                  aspectRatio: _controller.value.aspectRatio,
                  child: Stack(
                    children: [
                      VideoPlayer(_controller),
                      Positioned.fill(
                        child: IconButton(
                          onPressed: () {
                            setState(() {
                              _controller.value.isPlaying
                                  ? _controller.pause()
                                  : _controller.play();
                            });
                          },
                          icon: Icon(
                            _controller.value.isPlaying
                                ? Icons.pause
                                : Icons.play_arrow,
                            size: 30,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 25.0,
                        left: 10.0,
                        right: 10.0,
                        child: VideoProgressIndicator(
                          _controller,
                          colors: VideoProgressColors(
                            playedColor: Colors.blue,
                            bufferedColor: Colors.red,
                            backgroundColor: Colors.grey,
                          ),
                          allowScrubbing: true,
                        ),
                      ),
                      Positioned(
                        bottom: -10,
                        left: 10.0,
                        right: 10.0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "${_controller.value.position.toString().split(".")[0]}/${_controller.value.duration.toString().split(".")[0]}",
                            ),
                            IconButton(
                              style: IconButton.styleFrom(
                                maximumSize: Size(24, 24),
                                minimumSize: Size(20, 20),
                              ),
                              padding: EdgeInsets.zero,
                              onPressed: () {
                                _toggleFullScreen();
                              },
                              icon: Icon(
                                _isFullScreen
                                    ? Icons.fullscreen_exit
                                    : Icons.fullscreen,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
                : Container(),
      ),
    );
  }
}
