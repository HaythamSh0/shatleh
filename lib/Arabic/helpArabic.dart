// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class HelpArabic extends StatefulWidget {
  const HelpArabic({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HelpArabicState createState() => _HelpArabicState();
}

class _HelpArabicState extends State<HelpArabic> {
  late VideoPlayerController _controller;
  bool _isPlaying = false;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset('assets/videos/videoplayback.mp4')
      ..initialize().then((_) {
        setState(() {});
        // ignore: avoid_print
        print(
            "video controller initialized: ${_controller.value.isInitialized}");
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.green[50],
        appBar: AppBar(
          title: const Text('المساعدة'),
        ),
        body: Column(
          children: <Widget>[
            const SizedBox(
              height: 100,
            ),
            Container(
              alignment: Alignment.center,
              child: Column(
                children: const <Widget>[
                  Text(
                    'فيديو تعليمي',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  ),
                ],
              ),
            ),
            Container(
              child: _controller.value.isInitialized
                  ? AspectRatio(
                      aspectRatio: _controller.value.aspectRatio,
                      child: VideoPlayer(_controller),
                    )
                  : Container(),
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
                    const SizedBox(width: 10),
                    const Text("فيديو"),
                  ],
                ),
                const SizedBox(height: 15),
              ],
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(10, 240, 10, 10),
              alignment: Alignment.center,
              child: Column(
                children: const <Widget>[
                  Text('الإتصال بنا',
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
