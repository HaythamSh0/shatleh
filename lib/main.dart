import 'package:flutter/material.dart';
import 'package:shatleh/Arabic/editProfileArabic.dart';
import 'package:shatleh/Arabic/helpArabic.dart';
import 'package:shatleh/Arabic/historyArabic.dart';
import 'package:shatleh/Arabic/loginArabic.dart';
import 'package:shatleh/Arabic/profileArabic.dart';
import 'package:shatleh/Arabic/rootPageArabic.dart';
import 'package:shatleh/Arabic/settingsArabic.dart';
import 'package:shatleh/Arabic/signupArabic.dart';
import 'package:shatleh/history.dart';
import 'package:shatleh/auth.dart';
import 'package:shatleh/comment.dart';
import 'package:shatleh/contactExpert.dart';
import 'package:shatleh/editProfile.dart';
import 'package:shatleh/help.dart';
import 'package:shatleh/profile.dart';
import 'package:shatleh/rootPage.dart';
import 'package:shatleh/settings.dart';
import 'package:shatleh/signup.dart';
import 'package:shatleh/login.dart';
import 'package:firebase_core/firebase_core.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

final navigatorKey = GlobalKey<NavigatorState>();

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      theme: ThemeData(primarySwatch: Colors.green),
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const Auth(),
        '/login': (context) => const Login(),
        '/loginArabic': (context) => const LoginArabic(),
        '/signup': (context) => const Signup(),
        '/signupArabic': (context) => const SignupArabic(),
        '/rootpage': (context) => const RootPage(),
        '/rootpageArabic': (context) => const RootPageArabic(),
        '/profile': (context) => const Profile(),
        '/profileArabic': (context) => const ProfileArabic(),
        '/editProfile': (context) => const EditProfile(),
        '/editProfileArabic': (context) => const EditProfileArabic(),
        '/settings': (context) => const Settings(),
        '/settingsArabic': (_) => const SettingsArabic(),
        '/contactExpert': (context) => const ContactExpert(),
        '/comments': (context) => const Comments(),
        '/history': (context) => const History(),
        '/historyArabic': (context) => const HistoryArabic(),
        '/help': (context) => const Help(),
        '/helpArabic': (context) => const HelpArabic(),
      },
    );
  }
}
