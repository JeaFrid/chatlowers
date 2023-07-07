import 'package:chatlowers/widget/logo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jeafriday/jeafire.dart';
import 'package:jeafriday/jeafwidget.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../widget/dialog.dart';
import '../../theme/color.dart';
import '../../widget/backphoto.dart';
import '../../widget/body.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
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
                image: const AssetImage("assets/background.jpg"),
                child: Column(
                  children: [
                    Expanded(
                      child: Center(
                        child: BdBody(
                          scrollable: true,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Row(
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
                                      textfieldController: email,
                                      labelText: "E-posta",
                                      type: 3),
                                  JeaTextField(
                                      textfieldController: password,
                                      labelText: "Parola",
                                      type: 2),
                                  const SizedBox(height: 15),
                                  const SizedBox(height: 15),
                                  JeaButton(
                                    onTap: () async {
                                      if (email.text == "" ||
                                          password.text == "") {
                                      } else {
                                        loading.value = true;
                                        print("Bekle");
                                        final prefs = await SharedPreferences
                                            .getInstance();
                                        print("Prefs başladı");
                                        prefs.setString("eposta", email.text);
                                        print("Mail prefe eklendi");
                                        prefs.setString(
                                            "password", password.text);
                                        print("Password prefe eklendi");
                                        List x = await JeaFire.login(
                                            email.text, password.text);
                                        print("Giriş yapıldı");

                                        if (x[0].toString() == "1") {
                                          // ignore: use_build_context_synchronously
                                          Navigator.pushNamed(context, "/home");
                                        } else if (x[0].toString() == "0") {
                                          loading.value = false;
                                          // ignore: use_build_context_synchronously
                                          ByBugDialg.error(
                                              context,
                                              constraints,
                                              "Giriş başarısız oldu.",
                                              "Bir sorun oluştu.");
                                        }
                                      }
                                    },
                                    text: "Giriş Yap",
                                    hoverColor: BdColorDark.defaultColor,
                                    textColor: BdColorDark.textColor,
                                  ),
                                  const SizedBox(
                                    height: 30,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Navigator.popAndPushNamed(
                                          context, "/register");
                                    },
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    splashColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    child: JeaText(
                                      textAlign: TextAlign.center,
                                      text: "Hesap Oluştur",
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
