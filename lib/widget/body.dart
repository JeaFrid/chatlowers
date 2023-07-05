import 'package:flutter/material.dart';
import 'package:jeafriday/jeafwidget.dart';

class BdBody extends StatelessWidget {
  final bool scrollable;
  final ScrollController? controller;
  final List<Widget>? children;
  final ScrollPhysics? physics;
  final MainAxisAlignment? mainAxisAlignment;
  final MainAxisSize? mainAxisSize;
  final CrossAxisAlignment? crossAxisAlignment;
  const BdBody({
    super.key,
    required this.scrollable,
    this.children,
    this.controller,
    this.physics,
    this.mainAxisAlignment,
    this.mainAxisSize,
    this.crossAxisAlignment,
  });

  @override
  Widget build(BuildContext context) {
    return scrollable == false ? nonscroll() : scroll();
  }

  Widget nonscroll() {
    return Column(
      mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.start,
      crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.center,
      mainAxisSize: mainAxisSize ?? MainAxisSize.max,
      children: children ?? <Widget>[],
    );
  }

  Widget scroll() {
    return JeaVerticalScrollView(
      child: SingleChildScrollView(
        controller: controller,
        physics: physics,
        child: Column(
          mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.start,
          crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.center,
          mainAxisSize: mainAxisSize ?? MainAxisSize.max,
          children: children ?? <Widget>[],
        ),
      ),
    );
  }
}
