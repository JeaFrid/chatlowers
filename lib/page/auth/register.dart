import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jeafriday/jeafire.dart';
import 'package:jeafriday/jeafwidget.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../theme/color.dart';
import '../../widget/backphoto.dart';
import '../../widget/body.dart';
import '../../widget/dialog.dart';
import '../../widget/logo.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});

  final TextEditingController username = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final RxBool loading = false.obs;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BdColorDark.backgroundColor,
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return Stack(
            children: [
              BdBackgroundPhoto(
                image: AssetImage("assets/background.jpg"),
                child: Column(
                  children: [
                    Expanded(
                      child: Center(
                        child: BdBody(
                          scrollable: true,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ChatLoversLogo(),
                              ],
                            ),
                            SizedBox(
                              width: MediaQuery.sizeOf(context).width < 800
                                  ? MediaQuery.sizeOf(context).width * 0.8
                                  : MediaQuery.sizeOf(context).width / 3,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const SizedBox(height: 30),
                                  JeaTextField(
                                      textfieldController: username,
                                      labelText: "Kullanıcı Adı",
                                      type: 4),
                                  JeaTextField(
                                      textfieldController: email,
                                      labelText: "E-posta",
                                      type: 3),
                                  JeaTextField(
                                      textfieldController: password,
                                      labelText: "Parola",
                                      type: 2),
                                  const SizedBox(height: 15),
                                  JeaButton(
                                    onTap: () async {
                                      loading.value = true;
                                      List x = await JeaFire.register(
                                        email.text,
                                        password.text,
                                        [
                                          username.text,
                                          "Hey, benim adım ${username.text}",
                                          email.text,
                                          "${DateTime.now().day}-${DateTime.now().month}-${DateTime.now().year} ${DateTime.now().hour}:${DateTime.now().minute}:${DateTime.now().second}"
                                        ],
                                      );
                                      if (x[0].toString() == "1") {
                                        final prefs = await SharedPreferences
                                            .getInstance();
                                        prefs.setString("eposta", email.text);
                                        prefs.setString(
                                            "password", password.text);
                                        Navigator.popAndPushNamed(
                                            context, "/home");
                                      } else if (x[0].toString() == "0") {
                                        loading.value = false;
                                        ByBugDialg.error(
                                            context,
                                            constraints,
                                            "Kayıt başarısız oldu.",
                                            "Bir sorun oluştu.");
                                      }
                                    },
                                    text: "Kayıt Ol",
                                    hoverColor: BdColorDark.defaultColor,
                                    textColor: BdColorDark.textColor,
                                  ),
                                  const SizedBox(
                                    height: 30,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Navigator.popAndPushNamed(
                                          context, "/login");
                                    },
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    splashColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    child: JeaText(
                                      textAlign: TextAlign.center,
                                      text: "Giriş Yap",
                                      style: GoogleFonts.poppins(
                                        color: BdColorDark.textColor
                                            .withOpacity(0.7),
                                        fontSize: 12,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Obx(
                () => Visibility(
                  visible: loading.value,
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    color: BdColorDark.extraDarkColor.withOpacity(0.7),
                    child: Center(
                      child: CupertinoActivityIndicator(
                        radius: 12,
                        color: BdColorDark.textColor,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
