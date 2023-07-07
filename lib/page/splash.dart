import 'package:chatlowers/theme/color.dart';
import 'package:chatlowers/widget/backphoto.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jeafriday/jeafire.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../widget/logo.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future<void> getProf() async {
    final prefs = await SharedPreferences.getInstance();
    String? eposta = prefs.getString("eposta");
    String? password = prefs.getString("password");
    bool isSign = JeaFire.isSignedIn();
    if (isSign == false) {
      if (eposta.runtimeType == Null) {
        Navigator.popAndPushNamed(context, "/register");
      } else {
        await JeaFire.login(eposta!, password!);

        Future.delayed(
          const Duration(seconds: 5),
          () {
            Navigator.popAndPushNamed(context, "/home");
          },
        );
      }
    } else {
      Future.delayed(
        const Duration(seconds: 5),
        () {
          Navigator.popAndPushNamed(context, "/home");
        },
      );
    }
  }

  @override
  void initState() {
    super.initState();
    getProf();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BdColorDark.backgroundColor,
      body: const BdBackgroundPhoto(
        image: AssetImage("assets/background.jpg"),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ChatLoversLogo(),
                  SizedBox(
                    height: 12,
                  ),
                  CupertinoActivityIndicator(
                    radius: 12,
                    color: Colors.white54,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
