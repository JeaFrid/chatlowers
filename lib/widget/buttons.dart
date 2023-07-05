import 'package:flutter/material.dart';

import '../theme/color.dart';

class BdModernButton extends StatelessWidget {
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final BorderRadius? borderRadius;
  final double? width;
  final Color? backgroundColor;
  final Gradient? gradient;
  final double? height;
  final Color? color;
  final Widget? child;
  final String? text;
  final Color? focusColor;
  final Color? hoverColor;
  final Color? highlightColor;
  final Color? splashColor;
  final TextStyle? textStyle;
  const BdModernButton({
    super.key,
    this.padding,
    this.margin,
    this.width,
    this.height,
    this.color,
    this.borderRadius,
    this.gradient,
    this.child,
    this.text,
    this.textStyle,
    this.backgroundColor,
    this.focusColor,
    this.hoverColor,
    this.highlightColor,
    this.splashColor,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      hoverColor: hoverColor ?? BdColorDark.defaultColor,
      splashColor: splashColor ?? const Color.fromARGB(255, 79, 22, 235),
      highlightColor: highlightColor ?? const Color.fromARGB(255, 95, 45, 235),
      borderRadius: borderRadius ?? BorderRadius.circular(5),
      child: Container(
        padding: padding ?? const EdgeInsets.all(8),
        margin: margin,
        decoration: BoxDecoration(
          color: backgroundColor ?? Colors.transparent,
          borderRadius: borderRadius ?? BorderRadius.circular(5),
          gradient: gradient,
        ),
        width: width,
        height: height,
        child: child ??
            Text(
              text ?? "NullText",
              style: textStyle ??
                  TextStyle(
                      fontSize: 14,
                      color: BdColorDark.textColor,
                      fontWeight: FontWeight.w800),
            ),
      ),
    );
  }
}

class BdIconButton extends StatelessWidget {
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final BorderRadius? borderRadius;
  final double? width;
  final Color? backgroundColor;
  final Color? iconColor;
  final Gradient? gradient;
  final double? height;
  final Color? color;
  final IconData iconData;
  final String text;
  final void Function()? onTap;
  final void Function()? onDoubleTap;
  final void Function()? onLongPress;
  final Color? focusColor;
  final Color? hoverColor;
  final Color? highlightColor;
  final Color? splashColor;
  final TextStyle? textStyle;
  const BdIconButton({
    super.key,
    this.padding,
    this.margin,
    this.width,
    this.height,
    this.color,
    this.borderRadius,
    this.gradient,
    required this.iconData,
    required this.text,
    this.textStyle,
    this.backgroundColor,
    this.focusColor,
    this.hoverColor,
    this.highlightColor,
    this.splashColor,
    this.iconColor,
    this.onTap,
    this.onDoubleTap,
    this.onLongPress,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin ?? const EdgeInsets.all(0),
      child: InkWell(
        onTap: onTap ?? () {},
        onDoubleTap: onDoubleTap ?? () {},
        onLongPress: onLongPress ?? () {},
        focusColor: focusColor ?? Colors.yellow,
        hoverColor: hoverColor ?? BdColorDark.defaultColor,
        splashColor: splashColor ?? const Color.fromARGB(255, 79, 22, 235),
        highlightColor:
            highlightColor ?? const Color.fromARGB(255, 95, 45, 235),
        borderRadius: borderRadius ?? BorderRadius.circular(5),
        child: Container(
          margin: const EdgeInsets.all(2),
          padding: padding ?? const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: backgroundColor ?? Colors.transparent,
            borderRadius: borderRadius ?? BorderRadius.circular(5),
            gradient: gradient,
          ),
          width: width,
          height: height,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                iconData,
                color: iconColor ?? BdColorDark.textColor,
                size: 18,
              ),
              const SizedBox(width: 5),
              Text(
                text,
                style: textStyle ??
                    TextStyle(
                      fontSize: 14,
                      color: BdColorDark.textColor,
                      fontWeight: FontWeight.w800,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BdSingleButton extends StatelessWidget {
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final Function()? onTap;
  final double? width;
  final Color? backgroundColor;
  final Gradient? gradient;
  final double? height;
  final Color? color;

  final String? text;
  final Color? dividerColor;

  final TextStyle? textStyle;
  const BdSingleButton({
    super.key,
    this.padding,
    this.margin,
    this.width,
    this.height,
    this.color,
    this.gradient,
    this.text,
    this.textStyle,
    this.backgroundColor,
    this.dividerColor,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return InkWell(
          onTap: onTap ??() {},
          focusColor: Colors.transparent,
          hoverColor: Colors.transparent,
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          child: Container(
            padding: padding ?? const EdgeInsets.all(8),
            margin: margin ?? const EdgeInsets.all(8),
            decoration: BoxDecoration(
                color: backgroundColor ?? Colors.transparent,
                gradient: gradient,
                border: const Border.symmetric(
                    horizontal: BorderSide(width: 1, color: Colors.white24))),
            width: width,
            height: height,
            child: Text(
              text ?? "NullText",
              style: textStyle ??
                  TextStyle(
                    fontSize: 14,
                    color: BdColorDark.textColor,
                  ),
            ),
          ),
        );
      },
    );
  }
}

class BdMenuButton extends StatelessWidget {
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;

  final double? width;
  final Color? backgroundColor;
  final Gradient? gradient;
  final double? height;
  final Color? color;

  final String? text;
  final Color? dividerColor;

  final TextStyle? textStyle;
  const BdMenuButton({
    super.key,
    this.padding,
    this.margin,
    this.width,
    this.height,
    this.color,
    this.gradient,
    this.text,
    this.textStyle,
    this.backgroundColor,
    this.dividerColor,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Padding(
          padding: margin ?? const EdgeInsets.all(8),
          child: InkWell(
            onTap: () {},
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            child: Container(
              padding: padding ?? const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: backgroundColor ?? BdColorDark.brightnessColor,
                gradient: gradient,
                borderRadius: BorderRadius.circular(5),
                border: Border.all(
                    width: 1, color: const Color.fromARGB(45, 255, 255, 255)),
              ),
              width: width,
              height: height,
              child: Text(
                text ?? "null",
                style: textStyle ??
                    TextStyle(
                      fontSize: 14,
                      color: BdColorDark.textColor,
                    ),
              ),
            ),
          ),
        );
      },
    );
  }
}
