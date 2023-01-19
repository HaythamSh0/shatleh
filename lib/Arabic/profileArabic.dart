// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:shatleh/stat_Widget.dart';

class ProfileArabic extends StatefulWidget {
  const ProfileArabic({super.key});

  @override
  State<ProfileArabic> createState() => _ProfileArabicState();
}

class _ProfileArabicState extends State<ProfileArabic> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          const Padding(
            padding: EdgeInsets.only(right: 15, top: 4),
            child: Text(
              'ملفك الشخصي',
              style: TextStyle(
                fontSize: 25,
              ),
            ),
          ),
          IconButton(
            onPressed: () {
              Navigator.popUntil(
                  context, ModalRoute.withName('/rootpageArabic'));
            },
            icon: const Icon(Icons.arrow_forward),
          ),
        ],
        title: IconButton(
          icon: const Icon(
            Icons.edit,
          ),
          onPressed: () {
            Navigator.of(context).pushNamed('/editProfileArabic');
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 20,
            ),
            Container(
              width: 130,
              height: 130,
              decoration: BoxDecoration(
                  border: Border.all(
                    width: 2,
                    color: const Color.fromARGB(255, 0, 202, 10),
                  ),
                  boxShadow: [
                    BoxShadow(
                        spreadRadius: 2,
                        blurRadius: 10,
                        color: Colors.black.withOpacity(0.1))
                  ],
                  shape: BoxShape.circle,
                  image: const DecorationImage(
                      image: AssetImage('assets/images/profile.jpeg'))),
            ),
            const SizedBox(
              height: 20.0,
            ),
            const Text(
              "Your Name",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const SizedBox(
              height: 3.0,
            ),
            const Text(
              "Your@email",
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            const SizedBox(
              height: 12.0,
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                statWidget("المنشورات", "!"),
                statWidget("متابعين", "!"),
                statWidget("متابع", "!"),
              ],
            ),
            Expanded(
              child: Container(),
            ),
          ],
        ),
      ),
    );
  }
}
