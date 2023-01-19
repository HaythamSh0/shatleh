// ignore_for_file: file_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shatleh/rootPage.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final emailcont = TextEditingController();
  final usernamecont = TextEditingController();
  @override
  Widget build(BuildContext context) {
    emailcont.text = email;
    usernamecont.text = username;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Edit Profile',
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.settings,
            ),
            onPressed: () {
              Navigator.of(context).pushNamed('/settings');
            },
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.only(
          left: 16,
          top: 25,
          right: 16,
        ),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: ListView(
            children: [
              const SizedBox(
                height: 15,
              ),
              Center(
                child: Stack(
                  children: [
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
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            width: 2,
                            color: Colors.white,
                          ),
                          color: Colors.green,
                        ),
                        child: const Icon(
                          Icons.edit,
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 35,
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 35.0),
                child: TextField(
                  controller: usernamecont,
                  decoration: const InputDecoration(
                    labelText: 'Username',
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    hintStyle: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 35.0),
                child: TextField(
                  controller: emailcont,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    hintStyle: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 250,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  OutlinedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text(
                      'CANCEL',
                      style: TextStyle(
                        fontSize: 14,
                        letterSpacing: 2.2,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 60),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    onPressed: () {
                      if (emailcont.text.isNotEmpty &&
                          usernamecont.text.isNotEmpty) {
                        if (validateEmail(emailcont.text.toString())) {
                          try {
                            final docUser = FirebaseFirestore.instance
                                .collection('Authentication')
                                .doc(UserId);
                            docUser.update({
                              'username': usernamecont.text.toString(),
                              'email': emailcont.text.toString()
                            });
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  content: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: const [
                                      Text(
                                        'Details Saved Sucssefully!',
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
                                                    '/profile'));
                                          },
                                          child: const Text(
                                            "Close",
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
                          } on FirebaseException catch (e) {
                            showDialog(
                                context: context,
                                builder: (ctx) => AlertDialog(
                                    title: const Text("Unable To save"),
                                    content: Text('${e.message}')));
                          }
                        } else {
                          showDialog(
                              context: context,
                              builder: (ctx) => const AlertDialog(
                                  title: Text("Unable To save"),
                                  content: Text('Email structure invalid')));
                        }
                      } else {
                        showDialog(
                            context: context,
                            builder: (ctx) => const AlertDialog(
                                title: Text("Unable To save"),
                                content: Text('empty fields')));
                      }
                    },
                    child: const Text(
                      'SAVE',
                      style: TextStyle(
                          fontSize: 14,
                          letterSpacing: 2.2,
                          color: Colors.white),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
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
