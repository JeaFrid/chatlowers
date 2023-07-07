import 'package:chatlowers/theme/color.dart';
import 'package:chatlowers/widget/backphoto.dart';
import 'package:chatlowers/widget/body.dart';
import 'package:chatlowers/widget/stories.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jeafriday/jeafwidget.dart';
import '../widget/buttons.dart';
import '../widget/top.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

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
                  backgroundColor: BdColorDark.defaultColor.withOpacity(0.2),
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
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      BdStories(
                        width: 120,
                        height: 120,
                        onTap: () {},
                      ),
                      JeaText(
                        textAlign: TextAlign.center,
                        text: "JeaFriday",
                        style: GoogleFonts.poppins(
                          color: BdColorDark.textColor,
                          fontSize: 14,
                        ),
                      ),
                      JeaText(
                        textAlign: TextAlign.center,
                        text: "Merhaba, benim adım Jake Friday",
                        style: GoogleFonts.poppins(
                          color: BdColorDark.textColor,
                          fontSize: 12,
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
            color: Colors.white,
          )),
    );
  }
}
