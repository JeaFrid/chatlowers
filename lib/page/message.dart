import 'package:chatlowers/theme/color.dart';
import 'package:chatlowers/widget/backphoto.dart';
import 'package:chatlowers/widget/body.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jeafriday/jeafwidget.dart';

class MessagePage extends StatelessWidget {
  const MessagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BdColorDark.backgroundColor,
      body: BdBackgroundPhoto(
        image: AssetImage("assets/background.jpg"),
        child: BdBody(
          scrollable: false,
          children: [
            top(),
            Expanded(
              child: JeaVerticalScrollView(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      messageBubble(context, true),
                      messageBubble(context, false),
                      messageBubble(context, true),
                    ],
                  ),
                ),
              ),
            ),
            bottom()
          ],
        ),
      ),
    );
  }

  Widget messageBubble(BuildContext context, bool sender) {
    return SizedBox(
      width: double.infinity,
      child: Row(
        mainAxisAlignment:
            sender == true ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
            width: MediaQuery.sizeOf(context).width * 0.6,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: sender == true
                  ? BdColorDark.extraDarkColor.withOpacity(0.7)
                  : BdColorDark.defaultColor.withOpacity(0.7),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                JeaText(
                  text: "Kullanıcı Adı",
                  style: GoogleFonts.poppins(
                    color: BdColorDark.textColor,
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                JeaText(
                  text:
                      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                  style: GoogleFonts.poppins(
                    color: BdColorDark.textColor,
                    fontSize: 12,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    JeaText(
                      text: "20:00",
                      style: GoogleFonts.poppins(
                        color: BdColorDark.textColor.withOpacity(0.5),
                        fontSize: 10,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container bottom() {
    return Container(
      color: BdColorDark.extraDarkColor.withOpacity(0.7),
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: SizedBox(
          width: double.infinity,
          child: Row(
            children: [
              Expanded(
                  child: JeaTextField(
                textfieldController: TextEditingController(),
                labelText: "Mesaj yazın",
                type: 1,
              )),
              InkWell(
                borderRadius: BorderRadius.circular(1020),
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Icon(
                    Icons.send_rounded,
                    color: BdColorDark.textColor,
                    size: 25,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container top() {
    return Container(
      color: BdColorDark.extraDarkColor.withOpacity(0.7),
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: SizedBox(
          width: double.infinity,
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: ClipOval(
                  child: Image(
                    image: AssetImage("assets/man_pp.jpeg"),
                    width: 40,
                    height: 40,
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    JeaText(
                      text: "Mehmet",
                      style: GoogleFonts.poppins(
                        color: BdColorDark.textColor,
                        fontSize: 14,
                      ),
                    ),
                    JeaText(
                      text: "Aktif",
                      style: GoogleFonts.poppins(
                        color: BdColorDark.textColor.withOpacity(0.4),
                        fontSize: 10,
                      ),
                    ),
                  ],
                ),
              ),
              InkWell(
                borderRadius: BorderRadius.circular(1020),
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Icon(
                    Icons.more_vert,
                    color: BdColorDark.textColor,
                    size: 25,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
