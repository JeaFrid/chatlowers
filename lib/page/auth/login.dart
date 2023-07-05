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
                            ChatLoversLogo(),
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
                                  JeaText(
                                    text:
                                        "Giriş yaparak gizlilik politikalarımızı kabul etmiş olursunuz.",
                                    textAlign: TextAlign.center,
                                    fontSize: 12,
                                    textColor:
                                        BdColorDark.textColor.withOpacity(0.4),
                                  ),
                                  const SizedBox(height: 15),
                                  JeaButton(
                                    onTap: () async {
                                      loading.value = true;
                                      final prefs =
                                          await SharedPreferences.getInstance();
                                      prefs.setString("eposta", email.text);
                                      prefs.setString(
                                          "password", password.text);
                                      List x = await JeaFire.login(
                                          email.text, password.text);
                                      String uid = await JeaFire.getUID();
                                      // ignore: use_build_context_synchronously
                                      Navigator.pushNamed(
                                          context, '/profile/"$uid"');
                                      if (x[0].toString() == "1") {
                                      } else if (x[0].toString() == "0") {
                                        loading.value = false;
                                        ByBugDialg.error(
                                            context,
                                            constraints,
                                            "Giriş başarısız oldu.",
                                            "Bir sorun oluştu.");
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
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.policy,
                                  size: 22,
                                  color: BdColorDark.textColor,
                                ),
                                const SizedBox(width: 5),
                                JeaText(
                                  text: "Gizlilik Politikası",
                                  textColor: BdColorDark.textColor,
                                ),
                              ],
                            ),
                          ),
                        ],
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
