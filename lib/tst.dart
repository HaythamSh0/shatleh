// import 'dart:ui';

// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:samaak/login.dart';
// import 'package:samaak/main.dart';
// import 'package:samaak/mainpage.dart';

// import 'package:samaak/login.dart';
// import 'splashScreen.dart';

// //main function is the starting point for all Flutter applications
// void main() {
//   WidgetsFlutterBinding.ensureInitialized();
//   Firebase.initializeApp();
//   runApp(
//       SignUp()
//   );
// }

// final _auth = FirebaseAuth.instance;
// String email = '';
// String username = '';
// String password1 = '';
// String password2 = '';
// String password = '';

// class SignUp extends StatefulWidget {
//   const SignUp({Key? key}) : super(key: key);

//   @override
//   State<SignUp> createState() => _SignUpState();
// }

// class _SignUpState extends State<SignUp> {
//   @override
//   void dispose() {
//     super.dispose();
//   }
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Builder(
//           builder: (context) {
//             return Scaffold(
//               backgroundColor: Colors.blueGrey[100],
//               appBar: AppBar(
//                 title: const Center(
//                   child: Text('Samaak                                             سامعك'),
//                 ),
//                 backgroundColor: Colors.blue,
//               ),
//               body: SafeArea(
//                   child: SingleChildScrollView(
//                     child: Column(
//                       children:<Widget> [
//                         Container(
//                           height: 20.0,
//                           width: 300.0,
//                           // height: 100.0,
//                           // width: 100.0,
//                           margin: EdgeInsets.fromLTRB(3.0, 70.0, 0.0, 0.0),
//                           color: Colors.blueGrey[50],
//                         ),
//                         Container(
//                             width: 500.0,
//                             height: 610.0,
//                             margin: EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 0.0),
//                             color: Colors.white,
//                             child: Column(
//                               children:<Widget> [
//                                 SizedBox(height: 15.0,),
//                                 Text('انشاء حساب جديد', textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
//                                 SizedBox(height: 30.0),
//                                 // SizedBox(
//                                 //   child: TextField(
//                                 //       decoration: InputDecoration(
//                                 //           prefixIcon: IconButton(
//                                 //             icon: Icon(Icons.camera, color: Colors.blue,),
//                                 //             onPressed: (){},
//                                 //           ),
//                                 //           hintTextDirection: TextDirection.rtl,
//                                 //           hintText: 'الرجاء ادخال اسمك',
//                                 //           filled: true,
//                                 //           fillColor: Colors.blueGrey[50],
//                                 //           border: InputBorder.none
//                                 //       ),
//                                 //   ),
//                                 //   width: 330.0,
//                                 // ),
//                                 const SizedBox(height: 20.0),
//                                 SizedBox(
//                                   child:TextFormField(
//                                       onChanged: (value) {
//                                         username = value;
//                                       },
//                                       maxLength: 20,
//                                       inputFormatters: <TextInputFormatter>[
//                                         FilteringTextInputFormatter.allow(RegExp("[0-9a-zA-Z]")),
//                                       ],
//                                       decoration: InputDecoration(
//                                         hintTextDirection: TextDirection.rtl,
//                                         hintText: 'الرجاء ادخال اسم الحساب',
//                                         filled: true,
//                                         fillColor: Colors.blueGrey[50],
//                                         border: InputBorder.none,
//                                       )
//                                   ),
//                                   width: 330.0,
//                                 ),
//                                 const SizedBox(height: 20.0),
//                                 SizedBox(
//                                   child: TextField(
//                                       onChanged: (value) {
//                                         email = value;
//                                       },
//                                       inputFormatters: <TextInputFormatter>[
//                                         FilteringTextInputFormatter.allow(RegExp("[0-9a-zA-Z@._]")),
//                                       ],
//                                       decoration: InputDecoration(
//                                         hintTextDirection: TextDirection.rtl,
//                                         hintText: 'الرجاء ادخال البريد الاكتروني',
//                                         filled: true,
//                                         fillColor: Colors.blueGrey[50],
//                                         border: InputBorder.none,
//                                       )
//                                   ),
//                                   width: 330.0,
//                                 ),
//                                 const SizedBox(height: 20.0),
//                                 SizedBox(
//                                   child: TextField(
//                                       maxLength: 18,
//                                       onChanged: (value) {
//                                         password1 = value;
//                                       },
//                                       obscureText: true,
//                                       enableSuggestions: false,
//                                       autocorrect: false,
//                                       decoration: InputDecoration(
//                                         hintTextDirection: TextDirection.rtl,
//                                         hintText: 'الرجاء ادخال كلمة السر',
//                                         filled: true,
//                                         fillColor: Colors.blueGrey[50],
//                                         border: InputBorder.none,

//                                       )
//                                   ),
//                                   width: 330.0,
//                                 ),
//                                 const SizedBox(height: 20.0),
//                                 SizedBox(
//                                   child: TextField(
//                                       maxLength: 18,
//                                       onChanged: (value) {
//                                         password2 = value;
//                                       },
//                                       obscureText: true,
//                                       enableSuggestions: false,
//                                       autocorrect: false,
//                                       decoration: InputDecoration(
//                                         hintTextDirection: TextDirection.rtl,
//                                         hintText: 'الرجاء ادخال كلمة السر مرة اخرى',
//                                         filled: true,
//                                         fillColor: Colors.blueGrey[50],
//                                         border: InputBorder.none,

//                                       )
//                                   ),
//                                   width: 330.0,
//                                 ),
//                                 const SizedBox(height: 50.0),
//                                 FlatButton(
//                                     child: const Text('انشاء حساب', style: TextStyle(fontSize: 20.0),),
//                                     color: Colors.blueAccent,
//                                     textColor: Colors.white,
//                                     minWidth: 300.0,
//                                     onPressed: () async {
//                                       //Check whether all fields are filled or not
//                                       if(username.isNotEmpty && email.isNotEmpty && password1.isNotEmpty && password2.isNotEmpty) {
//                                         password = password1.toString();
//                                         //Check whether both passwords are similar or not
//                                         if(password1.toString() == password2.toString()){
//                                           try {
//                                             //Send the email and the password to firebase
//                                             await _auth
//                                                 .createUserWithEmailAndPassword(
//                                                 email: email.toString(),
//                                                 password: password1);
//                                             await Navigator.of(context).push(
//                                               //Navigate to the homepage
//                                               MaterialPageRoute(
//                                                 builder: (contex) => HomePage(),
//                                               ),
//                                             );
//                                           } on FirebaseAuthException catch (e) {
//                                             //If an error occurs, show the error in an alert
//                                             showDialog(
//                                                 context: context,
//                                                 builder: (ctx) =>
//                                                     AlertDialog(
//                                                         title: const Text(
//                                                             "تعذر تسجيل الحساب!"),
//                                                         content: Text('${e.message}')
//                                                     ));
//                                           } // Navigator.pushReplacement(context,
//                                         }else{
//                                           showDialog(
//                                               context: context,
//                                               builder: (ctx) =>
//                                               const AlertDialog(
//                                                   title: Text(
//                                                       "تعذر تسجيل الحساب!"),
//                                                   content: Text('كلمات السر لا تتطابق')
//                                               ));
//                                         } } else{
//                                         showDialog(
//                                             context: context,
//                                             builder: (ctx) =>
//                                             const AlertDialog(
//                                                 title: Text(
//                                                     "تعذر تسجيل الحساب!"),
//                                                 content: Text('جميع الخانات يجب ان تكون معبئة')
//                                             ));
//                                         //   MaterialPageRoute(builder: (BuildContext context) => HomePage()),);
//                                       }
//                                     }),
//                               ],
//                             )
//                         )

//                       ],
//                     ),
//                   )
//               ),
//             );
//           }
//       ),
//     );
//   }
// }