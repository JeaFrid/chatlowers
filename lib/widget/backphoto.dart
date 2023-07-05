import 'package:flutter/material.dart';

class BdBackgroundPhoto extends StatelessWidget {
  final Widget child;
  final double? opacity;
  final ImageProvider<Object>? image;
  final String? asset;
  final String? network;
  const BdBackgroundPhoto({
    super.key,
    required this.child,
    this.opacity,
    this.image,
    this.asset,
    this.network,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: Opacity(
                  opacity: opacity ?? 0.30,
                  child: Image(
                    image: image ?? const AssetImage(""),
                    errorBuilder: (context, error, stackTrace) =>
                        const SizedBox(),
                    width: double.infinity,
                    height: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
          child,
        ],
      ),
    );
  }
}
