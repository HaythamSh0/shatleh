// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class CaptureArabic extends StatefulWidget {
  const CaptureArabic({super.key});

  @override
  State<CaptureArabic> createState() => _CaptureState();
}

class _CaptureState extends State<CaptureArabic> {
  bool _load = false;
  late File
      imgFile; //this variable will hold the img we will use it later for back end
  final imgPicker = ImagePicker();

  Widget displayImg() {
    return Image.file(
      imgFile,
      width: 350,
      height: 350,
    );
  }

  void openCamera() async {
    var imgCamera = await imgPicker.pickImage(source: ImageSource.camera);
    setState(() {
      imgFile = File(imgCamera!.path);
      _load = true;
    });
  }

  void openGallery() async {
    var imgGallery = await imgPicker.pickImage(source: ImageSource.gallery);
    setState(() {
      _load = true;
      imgFile = File(imgGallery!.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              !_load
                  ? const Image(image: AssetImage('assets/images/profile.jpeg'))
                  : _load
                      ? displayImg()
                      : const SizedBox(),
              const SizedBox(
                height: 40.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      openCamera();
                      setState(() {});
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 50, vertical: 5),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: const Icon(
                      Icons.camera,
                      size: 40,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      openGallery();
                      setState(() {});
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 50, vertical: 5),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: const Icon(
                      Icons.file_upload_outlined,
                      size: 40,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
