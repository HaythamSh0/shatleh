// ignore_for_file: file_names

import 'package:flutter/material.dart';

class ContactExpert extends StatelessWidget {
  const ContactExpert({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        title: const Text("Contact Expert"),
      ),
      body: const Center(
        child: Text("Future Work..."),
      ),
    );
  }
}
