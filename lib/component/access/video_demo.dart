import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  final title = 'title';

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late VideoPlayerController _videoPlayerController;
  late Future<void> _initializedVideoPlayerFuture =
      _videoPlayerController.initialize();

  String videoUrl =
      'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4';
  String videoTrack = 'assets/video.mp4';
  @override
  void initState() {
    super.initState();
    _videoPlayerController = VideoPlayerController.network(videoUrl);
//    _videoPlayerController = VideoPlayerController.asset(videoTrack);
    _initializedVideoPlayerFuture = _videoPlayerController.initialize();

    _videoPlayerController.setLooping(true);
    _videoPlayerController.setVolume(1.0);
  }

  @override
  void dispose() {
    super.dispose();
    _videoPlayerController.dispose();
  }

  void _incrementCounter() {
    setState(() {
      _videoPlayerController.value.isPlaying
          ? _videoPlayerController.pause()
          : _videoPlayerController.play();
    });
  }

  @override
  Widget build(BuildContext context) {
    var title;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FutureBuilder(
              future: _initializedVideoPlayerFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return AspectRatio(
                    aspectRatio: _videoPlayerController.value.aspectRatio,
                    child: VideoPlayer(_videoPlayerController),
                  );
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'play/pause',
        child: Icon(_videoPlayerController.value.isPlaying
            ? Icons.pause
            : Icons.play_arrow),
      ),
    );
  }
}
