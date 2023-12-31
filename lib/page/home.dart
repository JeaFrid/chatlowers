import 'package:chatlowers/theme/color.dart';
import 'package:chatlowers/widget/backphoto.dart';
import 'package:chatlowers/widget/body.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jeafriday/jeafwidget.dart';
import '../widget/buttons.dart';
import '../widget/stories.dart';
import '../widget/top.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BdColorDark.backgroundColor,
      body: BdBackgroundPhoto(
        image: const AssetImage("assets/background.jpg"),
        child: BdBody(
          scrollable: false,
          children: [
            const Padding(
              padding: EdgeInsets.all(20),
              child: TopBar(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BdIconButton(
                  iconData: Icons.messenger_outlined,
                  text: "Mesaj Kutusu",
                  margin: const EdgeInsets.all(8),
                  backgroundColor: BdColorDark.defaultColor.withOpacity(0.2),
                  onTap: () {
                    Navigator.popAndPushNamed(context, "/home");
                  },
                ),
                BdIconButton(
                  iconData: Icons.amp_stories,
                  text: "Gönderiler",
                  margin: const EdgeInsets.all(8),
                  onTap: () {
                    Navigator.popAndPushNamed(context, "/posts");
                  },
                ),
                BdIconButton(
                  iconData: Icons.person_2_sharp,
                  text: "Hesabım",
                  margin: const EdgeInsets.all(8),
                  onTap: () async {
                    Navigator.popAndPushNamed(context, "/profile");
                  },
                ),
              ],
            ),
            Expanded(
              child: JeaVerticalScrollView(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: JeaHorizontalScrollView(
                          child: const SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                BdStories(),
                                BdStories(),
                                BdStories(),
                                BdStories(),
                                BdStories(),
                                BdStories(),
                                BdStories(),
                                BdStories(),
                                BdStories(),
                                BdStories(),
                                BdStories(),
                                BdStories(),
                                BdStories(),
                                BdStories(),
                                BdStories(),
                                BdStories(),
                              ],
                            ),
                          ),
                        ),
                      ),
                      message(
                        context,
                        "assets/girl_pp.png",
                        "Elif Su",
                        "Bugün nasılsın?",
                        "20:00",
                      ),
                      message(
                        context,
                        "assets/man_pp.jpeg",
                        "Mehmet",
                        "Bu akşam halısaha?",
                        "20:00",
                      ),
                      message(
                        context,
                        "assets/girl_pp.png",
                        "Naz",
                        "Ders notlarını aldım",
                        "20:00",
                      ),
                      message(
                        context,
                        "assets/man_pp.jpeg",
                        "Gökberk",
                        "Teşekkürler😃",
                        "20:00",
                      ),
                      message(
                        context,
                        "assets/girl_pp.png",
                        "Berra",
                        "Harikasın kanka!",
                        "20:00",
                      ),
                      message(
                        context,
                        "assets/man_pp.jpeg",
                        "Tuna",
                        "Kütüphane'de bilekliğimi unutmuşum😑",
                        "20:00",
                      ),
                      message(
                        context,
                        "assets/girl_pp.png",
                        "Tuğçe",
                        "Hayır! Bu gün Isparta'da yağışlı bir hava olacak.",
                        "20:00",
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: BdColorDark.defaultColor,
          child: const Icon(
            Icons.add,
            color: Colors.white,
          )),
    );
  }

  Widget message(BuildContext context, String image, String name,
      String message, String time) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, "/message");
      },
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      child: Container(
        margin: const EdgeInsets.all(5),
        padding: const EdgeInsets.all(10),
        width: double.infinity - 20,
        decoration: BoxDecoration(
          color: BdColorDark.extraDarkColor.withOpacity(0.6),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: ClipOval(
                child: Image(
                  image: AssetImage(image),
                  width: 60,
                  height: 60,
                ),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  JeaText(
                    text: name,
                    style: GoogleFonts.poppins(
                      color: BdColorDark.textColor,
                      fontSize: 14,
                    ),
                  ),
                  JeaText(
                    text: message,
                    style: GoogleFonts.poppins(
                      color: BdColorDark.textColor.withOpacity(0.7),
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
            JeaText(
              text: time,
              style: GoogleFonts.poppins(
                color: BdColorDark.textColor.withOpacity(0.7),
                fontSize: 10,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
