import 'package:chatlowers/theme/color.dart';
import 'package:chatlowers/widget/backphoto.dart';
import 'package:chatlowers/widget/body.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jeafriday/jeafwidget.dart';

import '../widget/buttons.dart';
import '../widget/logo.dart';
import '../widget/top.dart';

class PostsPage extends StatelessWidget {
  const PostsPage({super.key});

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
                  onTap: () {},
                ),
                BdIconButton(
                  iconData: Icons.amp_stories,
                  text: "Gönderiler",
                  backgroundColor: BdColorDark.defaultColor.withOpacity(0.2),
                  margin: const EdgeInsets.all(8),
                  onTap: () {},
                ),
                BdIconButton(
                  iconData: Icons.person_2_sharp,
                  text: "Hesabım",
                  margin: const EdgeInsets.all(8),
                  onTap: () async {},
                ),
              ],
            ),
            Expanded(
              child: JeaVerticalScrollView(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.all(5),
                        padding: const EdgeInsets.all(10),
                        width: double.infinity - 20,
                        decoration: BoxDecoration(
                          //color: BdColorDark.extraDarkColor.withOpacity(0.6),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8.0),
                                child: Row(
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.only(right: 10),
                                      child: ClipOval(
                                        child: Image(
                                          image:
                                              AssetImage("assets/girl_pp.png"),
                                          width: 30,
                                          height: 30,
                                        ),
                                      ),
                                    ),
                                    JeaText(
                                      text: "Berra Su",
                                      style: GoogleFonts.poppins(
                                        color: BdColorDark.textColor,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const Image(
                                image: AssetImage("assets/girl_pp.png"),
                                width: double.infinity,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8.0),
                                child: Row(
                                  children: [
                                    JeaText(
                                      text: "1.07.2023",
                                      style: GoogleFonts.poppins(
                                        color: BdColorDark.textColor
                                            .withOpacity(0.6),
                                        fontSize: 12,
                                      ),
                                    ),
                                    JeaText(
                                      text: " • ",
                                      style: GoogleFonts.poppins(
                                        color: BdColorDark.textColor
                                            .withOpacity(0.6),
                                        fontSize: 12,
                                      ),
                                    ),
                                    JeaText(
                                      text: "Berra Su",
                                      style: GoogleFonts.poppins(
                                        color: BdColorDark.textColor
                                            .withOpacity(0.6),
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              JeaText(
                                text:
                                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                                style: GoogleFonts.poppins(
                                  color: BdColorDark.textColor,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
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
          )),
    );
  }

  Widget message(String image, String name, String message, String time) {
    return InkWell(
      onTap: () {},
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
