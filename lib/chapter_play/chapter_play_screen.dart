import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:loginpage/module_wise.dart';
import 'package:video_player/video_player.dart';
import 'package:shimmer/shimmer.dart';
import 'package:universal_html/html.dart' as html;

class ChapterPlayScreen extends StatefulWidget {
  const ChapterPlayScreen({super.key});

  @override
  State<ChapterPlayScreen> createState() => _ChapterPlayScreenState();
}

class _ChapterPlayScreenState extends State<ChapterPlayScreen> {
  late VideoPlayerController _controller;
  bool _isFullScreen = false;
  bool _showOverlay = true;

  @override
  void initState() {
    super.initState();
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
            _controller.setVolume(1.0);
            setState(() {});
          });
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

  Widget _buildVideoPlayer() {
    return AspectRatio(
      aspectRatio: _controller.value.aspectRatio,
      child: Stack(
        alignment: Alignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: VideoPlayer(_controller),
          ),
          if (_showOverlay)
            GestureDetector(
              onTap: () {
                setState(() {
                  if (_controller.value.isPlaying) {
                    _controller.pause();
                  } else {
                    _controller.play();
                    _showOverlay = false;
                  }
                });
              },
              child: const Icon(
                Icons.play_circle_fill,
                size: 60,
                color: Colors.white,
              ),
            ),
          Positioned(
            bottom: 25.0,
            left: 10.0,
            right: 10.0,
            child: VideoProgressIndicator(
              _controller,
              allowScrubbing: true,
              colors: VideoProgressColors(
                playedColor: Colors.blue,
                bufferedColor: Colors.red,
                backgroundColor: Colors.grey,
              ),
            ),
          ),
          Positioned(
            bottom: 0.0,
            left: 10.0,
            right: 10.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "${_controller.value.position.toString().split(".")[0]}/${_controller.value.duration.toString().split(".")[0]}",
                  style: const TextStyle(color: Colors.white),
                ),
                Row(
                  children: [
                    IconButton(
                      icon: Icon(
                        _controller.value.isPlaying
                            ? Icons.pause
                            : Icons.play_arrow,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        setState(() {
                          if (_controller.value.isPlaying) {
                            _controller.pause();
                            _showOverlay = true;
                          } else {
                            _controller.play();
                            _showOverlay = false;
                          }
                        });
                      },
                    ),
                    IconButton(
                      icon: Icon(
                        _isFullScreen
                            ? Icons.fullscreen_exit
                            : Icons.fullscreen,
                        color: Colors.white,
                      ),
                      onPressed: _toggleFullScreen,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildShimmerPlaceholder() {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.white,
      child: Container(
        height: 220,
        margin: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.grey[400],
        ),
      ),
    );
  }

  Widget _buildVideoListItem(int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Material(
        elevation: 4,
        borderRadius: BorderRadius.circular(12),
        child: ListTile(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          leading: const Icon(Icons.video_library, color: Colors.blue),
          title: Text(
            'Lesson ${index + 1}',
            style: const TextStyle(fontWeight: FontWeight.w600),
          ),
          subtitle: const Text('5:00'),
          trailing: const Icon(Icons.check_circle, color: Colors.blue),
          onTap: () {
            // Future enhancement: load a new video
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lesson 1'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => ModuleWise()),
            );
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 10),

            // Video Player or Shimmer Placeholder
            _controller.value.isInitialized
                ? Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: _buildVideoPlayer(),
                )
                : _buildShimmerPlaceholder(),

            const SizedBox(height: 20),

            // Section Title: Introducing Flutter
            Container(
              padding: const EdgeInsets.symmetric(vertical: 16),
              width: double.infinity,
              color: Colors.blue,
              child: const Center(
                child: Text(
                  'Introducing Flutter',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            // Heading for video list
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'More Lessons',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),

            // Video List Items
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 5,
              itemBuilder: (context, index) => _buildVideoListItem(index),
            ),
          ],
        ),
      ),
    );
  }
}
