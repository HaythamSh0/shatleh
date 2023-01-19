// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  String username = "";
  String email = "";
  String mobileNumber = "";
  String password = "";
  Future signUp() async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password)
          .then(
        (user) {
          String uid = user.user!.uid;
          FirebaseFirestore.instance.collection('Authentication').doc(uid).set({
            'email': email,
            'mobile': mobileNumber,
            'user_id': uid,
            'username': username,
          });
        },
      );
    } on FirebaseAuthException catch (e) {
      showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
              title: const Text("Unable To Create Account"),
              content: Text('${e.message}')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Shatleh'),
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
                        title: const Text('Change Language'),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            OutlinedButton(
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
                              child: const Text(
                                'Arabic',
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
                                Navigator.of(context).pop();
                              },
                              child: const Text("Close")),
                        ],
                      );
                    });
              },
            ),
          ],
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
              Padding(
                padding:
                    const EdgeInsets.only(bottom: 40.0, left: 20, right: 20),
                child: TextField(
                  onChanged: (value) {
                    setState(() {
                      username = value;
                    });
                  },
                  obscureText: false,
                  decoration: const InputDecoration(
                    labelText: "Username",
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    hintText: ' ',
                    hintStyle: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(bottom: 40.0, left: 20, right: 20),
                child: TextField(
                  onChanged: ((value) {
                    setState(() {
                      mobileNumber = value;
                    });
                  }),
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  decoration: const InputDecoration(
                    labelText: 'Mobile Number',
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    hintText: '00962790174815',
                    hintStyle: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(bottom: 40.0, left: 20, right: 20),
                child: TextField(
                  onChanged: (value) {
                    setState(() {
                      email = value;
                    });
                  },
                  obscureText: false,
                  decoration: const InputDecoration(
                    labelText: "Email",
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    hintText: 'something@gmail.com',
                    hintStyle: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(bottom: 40.0, left: 20, right: 20),
                child: TextField(
                  onChanged: (value) {
                    setState(() {
                      password = value;
                    });
                  },
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: "Password",
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    hintText: '***************',
                    hintStyle: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
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
                      if (username.isNotEmpty &&
                          email.isNotEmpty &&
                          password.isNotEmpty &&
                          mobileNumber.isNotEmpty) {
                        //Check whether both passwords are similar or not
                        if (validatePassword(password.toString()) &&
                            validateEmail(email.toString()) &&
                            validatemobile(mobileNumber.toString())) {
                          try {
                            //Send the email and the password to firebase
                            signUp();
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  content: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      const Text(
                                        'Account Created Sucssefully!',
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
                                            Navigator.of(context)
                                                .pushNamed('/');
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
                          } on FirebaseAuthException catch (e) {
                            //If an error occurs, show the error in an alert
                            showDialog(
                                context: context,
                                builder: (ctx) => AlertDialog(
                                    title:
                                        const Text("Unable To Create Account"),
                                    content: Text('${e.message}')));
                          } // Navigator.pushReplacement(context,
                        } else {
                          showDialog(
                              context: context,
                              builder: (ctx) => const AlertDialog(
                                  title: Text("Unable To Create Account"),
                                  content: Text(
                                      "sign in fields do not specify the requirements")));
                        }
                      } else {
                        showDialog(
                            context: context,
                            builder: (ctx) => const AlertDialog(
                                title: Text("Unable To Create Account"),
                                content: Text("empty fields")));
                        //   MaterialPageRoute(builder: (BuildContext context) => HomePage()),);
                      }
                    },
                    child: const Text(
                      'Create Account',
                      style: TextStyle(
                          fontSize: 14,
                          letterSpacing: 2.2,
                          color: Colors.white),
                    ),
                  )
                ],
              )
            ]),
          ),
        ));
  }
}

bool validateStructurePassword(String value) {
  String pattern =
      r"^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$";
  RegExp regExp = RegExp(pattern);
  return regExp.hasMatch(value);
}

bool validateStructureEmail(String value) {
  String pattern =
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
  RegExp regExp = RegExp(pattern);
  return regExp.hasMatch(value);
}

bool validateStructureMobile(String value) {
  String pattern = r"^00962[0-9]{9}$";
  RegExp regExp = RegExp(pattern);
  return regExp.hasMatch(value);
}

bool validatePassword(String pass) {
  if (pass.isEmpty || pass.length < 8) {
    return false;
  } else if (!validateStructurePassword(pass)) {
    return false;
  } else {
    return true;
  }
}

bool validatemobile(String mobile) {
  if (mobile.isEmpty || mobile.length < 8) {
    return false;
  } else if (!validateStructureMobile(mobile)) {
    return false;
  } else {
    return true;
  }
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

bool validateUsername(String username) {
  if (username.isEmpty || username.length < 6 || username.length > 10) {
    return false;
  } else {
    return true;
  }
}
