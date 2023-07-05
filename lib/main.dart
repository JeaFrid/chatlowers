import 'package:chatlowers/page/home.dart';
import 'package:chatlowers/page/message.dart';
import 'package:chatlowers/page/posts.dart';
import 'package:chatlowers/theme/color.dart';
import 'package:chatlowers/widget/logo.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Chat Lover's",
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MessagePage());
  }
}
