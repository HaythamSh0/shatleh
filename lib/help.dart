import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter/services.dart';

class Help extends StatefulWidget {
  const Help({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HelpState createState() => _HelpState();
}

class _HelpState extends State<Help> {
  late VideoPlayerController _controller;
  bool _isPlaying = false;
  bool isFullScreen = false;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset('assets/videos/videoplayback.mp4')
      ..initialize().then((_) {
        setState(() {});
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[50],
      appBar: AppBar(
        title: const Text('Help'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const SizedBox(
              height: 100,
            ),
            Container(
              alignment: Alignment.center,
              child: Column(
                children: const <Widget>[
                  Text('Tutorial',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
                ],
              ),
            ),
            SizedBox(
              width: isFullScreen
                  ? MediaQuery.of(context).size.width * 0.68
                  : null,
              height: null,
              child: AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: VideoPlayer(_controller),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    IconButton(
                      icon: Icon(
                        _controller.value.isPlaying
                            ? Icons.pause
                            : Icons.play_arrow,
                      ),
                      onPressed: () {
                        setState(() {
                          _isPlaying = !_isPlaying;
                          _isPlaying ? _controller.play() : _controller.pause();
                        });
                      },
                    ),
                    IconButton(
                      icon: Icon(isFullScreen
                          ? Icons.fullscreen_exit
                          : Icons.fullscreen),
                      onPressed: () {
                        setState(() {
                          isFullScreen = !isFullScreen;
                          if (isFullScreen) {
                            SystemChrome.setPreferredOrientations([
                              DeviceOrientation.landscapeLeft,
                              DeviceOrientation.landscapeRight,
                            ]);
                          } else {
                            SystemChrome.setPreferredOrientations([
                              DeviceOrientation.portraitUp,
                              DeviceOrientation.portraitDown,
                            ]);
                          }
                        });
                      },
                    ),
                    const SizedBox(width: 10),
                    const Text("Video"),
                  ],
                ),
                const SizedBox(height: 15),
              ],
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(10, 280, 10, 10),
              alignment: Alignment.center,
              child: Column(
                children: const <Widget>[
                  Text('Contact Us',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  SizedBox(height: 10),
                  Text('Email: Shatleh@gmail.com'),
                  SizedBox(height: 10),
                  Text('© All Rights Reserved'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
