// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:shatleh/Arabic/captureArabic.dart';
import 'package:shatleh/Arabic/homePageArabic.dart';
import 'package:shatleh/Arabic/searchArabic.dart';
import 'package:shatleh/qANDa.dart';
import 'package:shatleh/notifications.dart';

class RootPageArabic extends StatefulWidget {
  const RootPageArabic({super.key});

  @override
  State<RootPageArabic> createState() => _RootPageArabicState();
}

class _RootPageArabicState extends State<RootPageArabic> {
  int currentPage = 0;
  List<Widget> pages = const [
    HomePageArabic(),
    Notifications(),
    CaptureArabic(),
    QandA(),
    SearchArabic(),
  ];
  @override
  Widget build(BuildContext context) {
    Future<bool> showExitPopup() async {
      return await showDialog(
            //show confirm dialogue
            //the return value will be from "Yes" or "No" options
            context: context,
            builder: (context) => AlertDialog(
              title: const Text('تسجيل خروج'),
              content: const Text('هل أنت متأكد؟'),
              actions: [
                OutlinedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  onPressed: () {
                    Navigator.popUntil(
                        context, ModalRoute.withName('/loginArabic'));
                  },
                  //return false when click on "NO"
                  child: const Text(
                    'لا',
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
                    Navigator.of(context).pushNamed('/loginArabic');
                  },
                  //return true when click on "Yes"
                  child: const Text('نعم'),
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
          automaticallyImplyLeading: false,
          title: const Text(
            "شتلة",
            style: TextStyle(
              fontSize: 25,
            ),
          ),
        ),
        endDrawer: Drawer(
          child: Directionality(
            textDirection: TextDirection.rtl,
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
                      const Text(
                        'اسم المستخدم',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      )
                    ],
                  ),
                ),
                ListTile(
                  leading: const Icon(
                    Icons.person,
                    color: Color.fromARGB(255, 0, 140, 7),
                  ),
                  title: const Text('الملف الشخصي'),
                  onTap: () {
                    Navigator.of(context).pushNamed('/profileArabic');
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.history,
                      color: Color.fromARGB(255, 0, 140, 7)),
                  title: const Text('السجل'),
                  onTap: () {
                    Navigator.of(context).pushNamed('/historyArabic');
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.settings,
                      color: Color.fromARGB(255, 0, 140, 7)),
                  title: const Text('الإعدادات'),
                  onTap: () {
                    Navigator.of(context).pushNamed('/settingsArabic');
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.contact_phone_rounded,
                      color: Color.fromARGB(255, 0, 140, 7)),
                  title: const Text('التواصل مع خبير'),
                  onTap: () {
                    Navigator.of(context).pushNamed('/contactExpert');
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.help_outline_outlined,
                      color: Color.fromARGB(255, 0, 140, 7)),
                  title: const Text('المساعدة'),
                  onTap: () {
                    Navigator.of(context).pushNamed('/helpArabic');
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.logout_outlined,
                      color: Color.fromARGB(255, 0, 140, 7)),
                  title: const Text('تسجيل خروج'),
                  onTap: () {
                    showDialog(
                      //show confirm dialogue
                      //the return value will be from "Yes" or "No" options
                      context: context,
                      builder: (context) => Directionality(
                        textDirection: TextDirection.rtl,
                        child: AlertDialog(
                          title: const Text('تسجيل خروج'),
                          content: const Text('هل أنت متأكد'),
                          actions: [
                            OutlinedButton(
                              style: ElevatedButton.styleFrom(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 50),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              //return false when click on "NO"
                              child: const Text(
                                'لا',
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 50),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              onPressed: () {
                                Navigator.of(context).pushNamed('/loginArabic');
                              },
                              //return true when click on "Yes"
                              child: const Text('نعم'),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
        body: pages[currentPage],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed, // Fixed
          backgroundColor: const Color.fromARGB(255, 255, 255, 255),

          unselectedItemColor: Colors.grey,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: const Icon(
                Icons.home,
                color: Color.fromARGB(255, 0, 140, 7),
              ), //Icon to be shown if not selected
              label: 'الرئيسية',
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
              label: 'تنبيهات',
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
              label: 'التقاط صورة',
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
              label: 'بحث',
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
