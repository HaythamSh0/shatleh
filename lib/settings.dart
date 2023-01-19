// ignore_for_file: non_constant_identifier_names

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  final emailcont = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Settings',
        ),
      ),
      body: Container(
        padding: const EdgeInsets.only(left: 16, top: 25, right: 16),
        child: ListView(
          children: [
            const SizedBox(
              height: 10,
            ),
            Row(
              children: const [
                Icon(
                  Icons.person,
                  color: Colors.green,
                ),
                SizedBox(
                  width: 8,
                ),
                Text(
                  'Account',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                )
              ],
            ),
            const Divider(
              height: 15,
              thickness: 2,
            ),
            const SizedBox(
              height: 10,
            ),
            CreateOption(context, "Change Password", true),
            CreateOption(context, 'Change Language', false),
          ],
        ),
      ),
    );
  }

  GestureDetector CreateOption(
      BuildContext context, String settingName, bool isPass) {
    return GestureDetector(
      onTap: () {
        isPass
            ? showDialog(
                //here will show dialog to change password
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text(settingName),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextField(
                          controller: emailcont,
                          decoration: const InputDecoration(
                            labelText: "Email",
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            hintText: "enter valid email",
                            hintStyle: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                    actions: [
                      OutlinedButton(
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(horizontal: 50),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          onPressed: () {
                            if (validateEmail(emailcont.text)) {
                              resetPassword();
                              showDialog(
                                  context: context,
                                  builder: (ctx) => const AlertDialog(
                                      title: CircleAvatar(
                                          child: Icon(Icons
                                              .add_to_home_screen_rounded)),
                                      content: Text('email send sucessfully')));
                            } else {
                              showDialog(
                                  context: context,
                                  builder: (ctx) => const AlertDialog(
                                      title: Text("Unable To send"),
                                      content: Text('enter valid email')));
                            }
                          },
                          child: const Text(
                            "Send",
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          )),
                    ],
                  );
                })
            : showDialog(
                //here will show a dialog to change Language
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
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
                                    title: const Text("Change to Arabic"),
                                    content: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: const [
                                        Text("Are you sure?"),
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
                                          Navigator.popUntil(context,
                                              ModalRoute.withName('/settings'));
                                        },
                                        child: const Text(
                                          "No",
                                          style: TextStyle(color: Colors.black),
                                        ),
                                      ),
                                      ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 50),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                            ),
                                          ),
                                          onPressed: () {
                                            Navigator.of(context)
                                                .pushNamed('/loginArabic');
                                          },
                                          child: const Text("yes")),
                                    ],
                                  );
                                });
                          },
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(horizontal: 50),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          child: const Text(
                            'عربي',
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
                            padding: const EdgeInsets.symmetric(horizontal: 50),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          onPressed: () {
                            Navigator.popUntil(
                                context, ModalRoute.withName('/settings'));
                          },
                          child: const Text("Close")),
                    ],
                  );
                },
              );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              settingName,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Colors.grey[600],
              ),
            ),
            const Icon(
              Icons.arrow_forward_ios,
              color: Colors.grey,
            )
          ],
        ),
      ),
    );
  }

  Future resetPassword() async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: emailcont.text.trim());
      // ignore: use_build_context_synchronously
      Navigator.of(context).popUntil((route) => route.isFirst);
    } on FirebaseAuthException catch (e) {
      showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
              title: const Text("firebase exception"),
              content: Text('${e.message}')));
    }
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

bool validateStructureEmail(String value) {
  String pattern =
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
  RegExp regExp = RegExp(pattern);
  return regExp.hasMatch(value);
}

bool validateEmail(String email) {
  if (email.isEmpty || email.length < 8) {
    return false;
  } else if (!validateStructureEmail(email)) {
    return false;
  } else {
    return true;
  }
}
