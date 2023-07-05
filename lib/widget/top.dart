
import 'package:flutter/material.dart';

import '../theme/color.dart';
import 'logo.dart';

class TopBar extends StatelessWidget {
  const TopBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const ChatLoversLogo(),
        Row(
          children: [
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
      ],
    );
  }
}
