// ignore_for_file: file_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shatleh/Capture.dart';
import 'package:shatleh/home_page.dart';
import 'package:shatleh/searchR.dart';
import 'package:shatleh/qANDa.dart';
import 'package:shatleh/notifications.dart';

class RootPage extends StatefulWidget {
  const RootPage({super.key});

  @override
  State<RootPage> createState() => _RootPageState();
}

String email = "";
String username = "";
// ignore: non_constant_identifier_names
String UserId = "";

class _RootPageState extends State<RootPage> {
  int currentPage = 0;
  List<Widget> pages = const [
    HomePage(),
    Notifications(),
    Capture(),
    QandA(),
    Search(),
  ];
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    UserId = user.uid;
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    final docRef = firestore.collection('Authentication').doc(user.uid);
    docRef.get().then(
      (DocumentSnapshot docSnapshot) {
        final data = docSnapshot.data() as Map<String, dynamic>;
        username = data['username'];
        email = data['email'];
      },
    );
    Future<bool> showExitPopup() async {
      //this funtion to make sure that the users wants to logout if they press back btn
      return await showDialog(
            //the return value will be from "Yes" or "No" options
            context: context,
            builder: (context) => AlertDialog(
              title: const Text('Logout'),
              content: const Text('Do you want to Logout?'),
              actions: [
                OutlinedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  onPressed: () => Navigator.of(context).pop(false),
                  //return false when click on "NO"
                  child: const Text(
                    'No',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  onPressed: () {
                    FirebaseAuth.instance.signOut();
                    Navigator.of(context).pop();
                  },
                  //return true when click on "Yes"
                  child: const Text("Yes"),
                ),
              ],
            ),
          ) ??
          false; //if showDialouge had returned null, then return false
    }

    return WillPopScope(
      onWillPop: showExitPopup,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Shatleh"),
        ),
        drawer: Drawer(
          child: ListView(
            children: [
              Container(
                color: Colors.green,
                width: double.infinity,
                height: 200,
                padding: const EdgeInsets.only(top: 20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(bottom: 10),
                      height: 110,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: AssetImage('assets/images/profile.jpeg'),
                          )),
                    ),
                    Text(
                      username,
                      style: const TextStyle(color: Colors.white, fontSize: 20),
                    )
                  ],
                ),
              ),
              ListTile(
                leading: const Icon(
                  Icons.person,
                  color: Color.fromARGB(255, 0, 140, 7),
                ),
                title: const Text('Profile'),
                onTap: () {
                  Navigator.of(context).pushNamed('/profile');
                },
              ),
              ListTile(
                leading: const Icon(Icons.history,
                    color: Color.fromARGB(255, 0, 140, 7)),
                title: const Text('History'),
                onTap: () {
                  Navigator.of(context).pushNamed('/history');
                },
              ),
              ListTile(
                leading: const Icon(Icons.settings,
                    color: Color.fromARGB(255, 0, 140, 7)),
                title: const Text('Settings'),
                onTap: () {
                  Navigator.of(context).pushNamed('/settings');
                },
              ),
              ListTile(
                leading: const Icon(Icons.contact_phone_rounded,
                    color: Color.fromARGB(255, 0, 140, 7)),
                title: const Text('Contact Expert'),
                onTap: () {
                  Navigator.of(context).pushNamed('/contactExpert');
                },
              ),
              ListTile(
                leading: const Icon(Icons.help_outline_outlined,
                    color: Color.fromARGB(255, 0, 140, 7)),
                title: const Text('Help'),
                onTap: () {
                  Navigator.of(context).pushNamed('/help');
                },
              ),
              ListTile(
                leading: const Icon(Icons.logout_outlined,
                    color: Color.fromARGB(255, 0, 140, 7)),
                title: const Text('Logout'),
                onTap: () {
                  showDialog(
                    //show confirm dialogue
                    //the return value will be from "Yes" or "No" options
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text('Logout'),
                      content: const Text('Do you want to Logout?'),
                      actions: [
                        OutlinedButton(
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(horizontal: 50),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          onPressed: () => Navigator.of(context).pop(),
                          //return false when click on "NO"
                          child: const Text(
                            'No',
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(horizontal: 50),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          onPressed: () {
                            FirebaseAuth.instance.signOut();
                            Navigator.of(context).pop();
                          },
                          //return true when click on "Yes"
                          child: const Text('Yes'),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
        body: pages[currentPage],
        // floatingActionButton: FloatingActionButton(
        //   onPressed: () {
        //     debugPrint('Floating TackPic');
        //   },
        //   child: const Icon(Icons.add_a_photo_outlined),
        // ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed, // Fixed
          backgroundColor: const Color.fromARGB(255, 255, 255, 255),

          selectedFontSize: 9,
          unselectedFontSize: 10,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: const Icon(
                Icons.home,
                color: Color.fromARGB(255, 0, 140, 7),
              ), //Icon to be shown if not selected
              label: 'Home',
              activeIcon: Container(
                  decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 221, 236, 221),
                      shape: BoxShape.circle),
                  child: const Padding(
                      padding: EdgeInsets.all(8), child: Icon(Icons.home))),
            ),
            BottomNavigationBarItem(
              icon: const Icon(
                Icons.notifications_active,
                color: Color.fromARGB(255, 0, 140, 7),
              ), //Icon to be shown if not selected
              label: 'Notifications',
              activeIcon: Container(
                  decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 221, 236, 221),
                      shape: BoxShape.circle),
                  child: const Padding(
                      padding: EdgeInsets.all(8),
                      child: Icon(Icons.notifications_active))),
            ),
            BottomNavigationBarItem(
              icon: const Icon(
                Icons.camera,
                color: Color.fromARGB(255, 0, 140, 7),
              ), //Icon to be shown if not selected
              label: 'Capture',
              activeIcon: Container(
                  decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 221, 236, 221),
                      shape: BoxShape.circle),
                  child: const Padding(
                      padding: EdgeInsets.all(8), child: Icon(Icons.camera))),
            ),
            BottomNavigationBarItem(
              icon: const Icon(
                Icons.quora,
                color: Color.fromARGB(255, 0, 140, 7),
              ), //Icon to be shown if not selected
              label: 'Q&A',
              activeIcon: Container(
                  decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 221, 236, 221),
                      shape: BoxShape.circle),
                  child: const Padding(
                      padding: EdgeInsets.all(8), child: Icon(Icons.quora))),
            ),
            BottomNavigationBarItem(
              icon: const Icon(
                Icons.search,
                color: Color.fromARGB(255, 0, 140, 7),
              ), //Icon to be shown if not selected
              label: 'Search',
              activeIcon: Container(
                  decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 221, 236, 221),
                      shape: BoxShape.circle),
                  child: const Padding(
                      padding: EdgeInsets.all(8), child: Icon(Icons.search))),
            ),
          ],
          onTap: (int index) {
            setState(() {
              currentPage = index;
            });
          },
          currentIndex: currentPage,
        ),
      ),
    );
  }
}
