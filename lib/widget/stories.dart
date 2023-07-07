import 'package:flutter/material.dart';

import '../theme/color.dart';

class BdStories extends StatelessWidget {
  final void Function()? onTap;
  final void Function()? onLongPress;
  final EdgeInsets? margin;
  final String? image;
  final double? height;
  final double? width;
  const BdStories({
    super.key,
    this.onTap,
    this.image,
    this.onLongPress,
    this.margin,
    this.height,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin ?? const EdgeInsets.all(8.0),
      child: Container(
        height: height ?? 75,
        width: width ?? 75,
        padding: const EdgeInsets.all(2),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: BdColorDark.defaultColor,
        ),
        child: InkWell(
          onTap: onTap ?? () {},
          onLongPress: onLongPress ?? () {},
          focusColor: Colors.transparent,
          hoverColor: Colors.transparent,
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          child: ClipOval(
            child: Image.network(
              image ?? "",
              height: height ?? 75,
              width: width ?? 75,
              errorBuilder: (context, error, stackTrace) {
                return Image.asset(
                  "assets/man_pp.jpeg",
                  height: height ?? 75,
                  width: width ?? 75,
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
