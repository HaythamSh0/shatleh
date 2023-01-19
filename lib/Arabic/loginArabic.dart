// ignore_for_file: file_names

import 'package:flutter/material.dart';

// final _auth = FirebaseAuth.instance;
String email = '';
String password = '';

class LoginArabic extends StatefulWidget {
  const LoginArabic({super.key});

  @override
  State<LoginArabic> createState() => _LoginArabicState();
}

class _LoginArabicState extends State<LoginArabic> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          actions: [
            IconButton(
              icon: const Icon(
                Icons.language,
              ),
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('تغيير اللغة'),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            OutlinedButton(
                                style: ElevatedButton.styleFrom(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 50),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                                onPressed: () {
                                  Navigator.of(context).pushNamed('/login');
                                },
                                child: const Text(
                                  'English',
                                  style: TextStyle(
                                    color: Colors.black,
                                  ),
                                )),
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
                                    ModalRoute.withName('/loginArabic'));
                              },
                              child: const Text("إغلاق")),
                        ],
                      );
                    });
              },
            ),
          ],
          title: const Padding(
            padding: EdgeInsets.only(right: 10, top: 6),
            child: Text(
              'شتلة',
              style: TextStyle(
                fontSize: 25,
              ),
            ),
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 241, 255, 242),
        body: SingleChildScrollView(
          child: Center(
            child: Column(children: [
              const SizedBox(
                height: 50,
              ),
              Container(
                width: 220,
                height: 220,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          spreadRadius: 10,
                          blurRadius: 10,
                          color: Colors.black.withOpacity(0.1))
                    ],
                    shape: BoxShape.circle,
                    image: const DecorationImage(
                        image: AssetImage('assets/images/Logo.jpeg'))),
              ),
              const SizedBox(
                height: 70,
              ),
              buildTextField('إيميل', 'something@gmail.com', false),
              buildTextField('كلمة السر', '***************', true),
              const SizedBox(
                height: 180,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  OutlinedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context).pushNamed('/signupArabic');
                    },
                    child: const Text(
                      'مستخدم جديد',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: Colors.black),
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 45),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context).pushNamed('/rootpageArabic');
                    },
                    child: const Text(
                      'تسجيل دخول',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: Colors.white),
                    ),
                  )
                ],
              )
            ]),
          ),
        ),
      ),
    );
  }

  Widget buildTextField(String? label, String? placeHolder, bool isPass) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 40.0, left: 20, right: 20),
      child: TextField(
        obscureText: isPass,
        decoration: InputDecoration(
          labelText: label,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          hintText: placeHolder,
          hintStyle: const TextStyle(
            fontSize: 16,
            color: Colors.grey,
          ),
        ),
      ),
    );
  }
}
