// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SignupArabic extends StatefulWidget {
  const SignupArabic({super.key});

  @override
  State<SignupArabic> createState() => _SignupArabicState();
}

class _SignupArabicState extends State<SignupArabic> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            actions: [
              IconButton(
                onPressed: () {
                  Navigator.popUntil(
                      context, ModalRoute.withName('/loginArabic'));
                },
                icon: const Icon(Icons.arrow_forward),
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
                  width: 190,
                  height: 190,
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
                buildTextField('إسم المستخدم', '', false),
                buildNumberField('رقم العاتف', '00962790174815'),
                buildTextField('إيميل', 'something@gmail.com', false),
                buildTextField('كلمة السر', '***************', true),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(horizontal: 40),
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
                                    '!تم إنشاء حساب جديد بنجاح',
                                    style: TextStyle(
                                        fontSize: 17,
                                        color: Color.fromARGB(255, 0, 151, 5)),
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
                                                '/loginArabic'));
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
                        'إنشاء حساب',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  ],
                )
              ]),
            ),
          )),
    );
  }
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

Widget buildNumberField(String? label, String? placeHolder) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 40.0, left: 20, right: 20),
    child: TextField(
      keyboardType: TextInputType.number,
      inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter.digitsOnly
      ],
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
