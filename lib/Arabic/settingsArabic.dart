// ignore_for_file: file_names

import 'package:flutter/material.dart';

class SettingsArabic extends StatefulWidget {
  const SettingsArabic({super.key});

  @override
  State<SettingsArabic> createState() => _SettingsArabicState();
}

class _SettingsArabicState extends State<SettingsArabic> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          const Padding(
            padding: EdgeInsets.only(right: 15, top: 10),
            child: Text(
              'الإعدادات',
              style: TextStyle(
                fontSize: 25,
              ),
            ),
          ),
          IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.arrow_forward),
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.only(left: 16, top: 25, right: 16),
        child: ListView(
          children: [
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: const [
                Text(
                  'الحساب',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 8,
                ),
                Icon(
                  Icons.person,
                  color: Colors.green,
                ),
              ],
            ),
            const Divider(
              height: 15,
              thickness: 2,
            ),
            const SizedBox(
              height: 10,
            ),
            createOption(context, "تغيير كلمة السر", true),
            createOption(context, 'تغيير اللغة', false),
          ],
        ),
      ),
    );
  }

  GestureDetector createOption(
      BuildContext context, String settingName, bool isPass) {
    return GestureDetector(
      onTap: () {
        isPass
            ? showDialog(
                //here will show dialog to change password
                context: context,
                builder: (BuildContext context) {
                  return Directionality(
                    textDirection: TextDirection.rtl,
                    child: AlertDialog(
                      title: Text(settingName),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          buildTextField("كلمة السر القديمة", "", true),
                          buildTextField("كلمة السر الجديدة", "", true),
                          buildTextField("اعادة كتابة كلمة السر", "", true),
                        ],
                      ),
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
                              Navigator.popUntil(context,
                                  ModalRoute.withName('/settingsArabic'));
                            },
                            child: const Text(
                              "إغلاق",
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            )),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(horizontal: 50),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          onPressed: () {
                            showDialog(
                              //on press save button adialog will show message that saved sucssefully
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  content: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: const [
                                      Text(
                                        '!تم حفظ كلمة السر بنجاح',
                                        style: TextStyle(
                                            fontSize: 17,
                                            color:
                                                Color.fromARGB(255, 0, 151, 5)),
                                      )
                                    ],
                                  ),
                                  actions: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        OutlinedButton(
                                          onPressed: () {
                                            Navigator.popUntil(
                                                context,
                                                ModalRoute.withName(
                                                    '/settingsArabic'));
                                          },
                                          child: const Text(
                                            "إغلاق",
                                            style: TextStyle(
                                              color: Colors.black,
                                            ),
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                );
                              },
                            );
                          },
                          child: const Text(
                            "حفظ",
                          ),
                        ),
                      ],
                    ),
                  );
                })
            : showDialog(
                //here will show a dialog to change Language
                context: context,
                builder: (BuildContext context) {
                  return Directionality(
                    textDirection: TextDirection.rtl,
                    child: AlertDialog(
                      title: Text(settingName),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          OutlinedButton(
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title:
                                          const Text("English تغيير اللغة الى"),
                                      content: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: const [
                                          Text("هل انت متأكد؟"),
                                        ],
                                      ),
                                      actions: [
                                        OutlinedButton(
                                          style: ElevatedButton.styleFrom(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 50),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                            ),
                                          ),
                                          onPressed: () {
                                            Navigator.popUntil(
                                                context,
                                                ModalRoute.withName(
                                                    '/settingsArabic'));
                                          },
                                          child: const Text(
                                            "لا",
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                        ),
                                        ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 50),
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                              ),
                                            ),
                                            onPressed: () {
                                              Navigator.of(context)
                                                  .pushNamed('/login');
                                            },
                                            child: const Text("نعم")),
                                      ],
                                    );
                                  });
                            },
                            style: ElevatedButton.styleFrom(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 50),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            child: const Text(
                              'English',
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                      actions: [
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 50),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            onPressed: () {
                              Navigator.popUntil(context,
                                  ModalRoute.withName('/settingsArabic'));
                            },
                            child: const Text("إغلاق")),
                      ],
                    ),
                  );
                },
              );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Icon(
              Icons.arrow_back_ios,
              color: Colors.grey,
            ),
            Text(
              settingName,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Colors.grey[600],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget buildTextField(String? label, String? placeHolder, bool isPass) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 15.0),
    child: TextField(
      obscureText: isPass,
      decoration: InputDecoration(
        labelText: label,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        hintText: placeHolder,
        hintStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
    ),
  );
}
