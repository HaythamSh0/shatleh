// ignore_for_file: file_names

import 'package:flutter/material.dart';

class EditProfileArabic extends StatefulWidget {
  const EditProfileArabic({super.key});

  @override
  State<EditProfileArabic> createState() => _EditProfileArabicState();
}

class _EditProfileArabicState extends State<EditProfileArabic> {
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
                  context, ModalRoute.withName('/profileArabic'));
            },
            icon: const Icon(Icons.arrow_forward),
          ),
        ],
        title: IconButton(
          icon: const Icon(
            Icons.settings,
          ),
          onPressed: () {
            Navigator.of(context).pushNamed('/settingsArabic');
          },
        ),
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
              buildTextField("إسم المستخدم", "Alex Mardini"),
              buildTextField("البريد الإلكتروني", "something@gmail.com"),
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
                      Navigator.popUntil(
                          context, ModalRoute.withName('/profileArabic'));
                    },
                    child: const Text(
                      'إلغاء',
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
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: const [
                                Text(
                                  'تم حفظ البيانات بنجاح',
                                  style: TextStyle(
                                      fontSize: 17,
                                      color: Color.fromARGB(255, 0, 151, 5)),
                                )
                              ],
                            ),
                            actions: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
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
                                      Navigator.popUntil(
                                          context,
                                          ModalRoute.withName(
                                              '/profileArabic'));
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
                      'حفظ',
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

  Widget buildTextField(String? label, String? placeHolder) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 35.0),
      child: TextField(
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
}
