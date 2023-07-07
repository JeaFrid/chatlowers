import 'package:chatlowers/page/auth/register.dart';
import 'package:chatlowers/page/home.dart';
import 'package:chatlowers/page/message.dart';
import 'package:chatlowers/page/profile.dart';
import 'package:chatlowers/page/splash.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'page/auth/login.dart';
import 'firebase_options.dart';
import 'page/posts.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        routes: {
          "/home": (context) => const HomePage(),
          "/register": (context) => RegisterPage(),
          "/login": (context) => LoginPage(),
          "/message": (context) => MessagePage(),
          "/profile": (context) => ProfilePage(),
          "/posts": (context) => PostsPage(),
        },
        debugShowCheckedModeBanner: false,
        title: "Chat Lover's",
        theme: ThemeData(
          primarySwatch: Colors.grey,
        ),
        home: SplashScreen());
  }
}
