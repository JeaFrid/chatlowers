import 'package:chatlowers/theme/color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jeafriday/jeafwidget.dart';

class ChatLoversLogo extends StatelessWidget {
  const ChatLoversLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return classic();
  }

  Column dev() {
    return Column(
      children: [
        Row(
          children: [
            JeaText(
              text: "Chat",
              style: GoogleFonts.merriweather(
                color: BdColorDark.textColor,
                fontSize: 62,
              ),
            ),
            SizedBox(width: 5),
            Icon(
              Icons.chat_bubble,
              size: 54,
              color: BdColorDark.defaultColor,
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(left: 14),
          child: Row(
            children: [
              JeaText(
                text: "Lover's",
                style: GoogleFonts.merriweather(
                  color: BdColorDark.textColor,
                  fontSize: 62,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Column classic() {
    return Column(
      children: [
        Row(
          children: [
            JeaText(
              text: "Chat",
              style: GoogleFonts.merriweather(
                color: BdColorDark.textColor,
                fontSize: 22,
              ),
            ),
            SizedBox(width: 5),
            Icon(
              Icons.chat_bubble,
              size: 22,
              color: BdColorDark.defaultColor,
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(left: 14),
          child: Row(
            children: [
              JeaText(
                text: "Lover's",
                style: GoogleFonts.merriweather(
                  color: BdColorDark.textColor,
                  fontSize: 22,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
