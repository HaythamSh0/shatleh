// ignore_for_file: non_constant_identifier_names

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String email = "";
  String password = "";
  Future Login() async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
              title: const Text("Unable To Login into Your Account"),
              content: Text('${e.message}')));
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Shatleh'),
        actions: [
          IconButton(
            // change Language icon
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
                                'عربي',
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
              // shatleh logo container
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
            Padding(
              padding: const EdgeInsets.only(bottom: 40.0, left: 20, right: 20),
              child: TextField(
                onChanged: (value) {
                  setState(() {
                    email = value;
                  });
                },
                obscureText: false,
                decoration: const InputDecoration(
                  labelText: 'Email',
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
              padding: const EdgeInsets.only(bottom: 40.0, left: 20, right: 20),
              child: TextField(
                onChanged: (value) {
                  setState(() {
                    password = value;
                  });
                },
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Password',
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
              height: 130,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                OutlinedButton(
                  //signup button
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).pushNamed(
                      '/signup',
                    );
                  },
                  child: const Text(
                    'Sign-Up',
                    style: TextStyle(
                        fontSize: 14, letterSpacing: 2.2, color: Colors.black),
                  ),
                ),
                ElevatedButton(
                  //login button
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 60),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  onPressed: () async {
                    if (FirebaseAuth.instance.currentUser != null) {
                      FirebaseAuth.instance.signOut();
                    }
                    if (email.isNotEmpty && password.isNotEmpty) {
                      if (validateEmail(email.toString())) {
                        try {
                          Login();
                        } on FirebaseAuthException catch (e) {
                          showDialog(
                              context: context,
                              builder: (ctx) => AlertDialog(
                                  title: const Text(
                                      "Unable To Login into Your Account"),
                                  content: Text('${e.message}')));
                        }
                      } else {
                        showDialog(
                            context: context,
                            builder: (ctx) => const AlertDialog(
                                title: Text("Unable To login"),
                                content: Text(
                                    "You Entered Invalid Email Structure")));
                      }
                    } else {
                      showDialog(
                          context: context,
                          builder: (ctx) => const AlertDialog(
                              title: Text("Unable To login"),
                              content: Text("empty fields")));
                    }
                  },
                  child: const Text(
                    'Login',
                    style: TextStyle(
                        fontSize: 14, letterSpacing: 2.2, color: Colors.white),
                  ),
                )
              ],
            )
          ]),
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
