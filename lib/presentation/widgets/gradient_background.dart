import 'package:flutter/material.dart';

class GradientBackground extends StatelessWidget {
  final Widget child;
  final double? padding;
  const GradientBackground({
    Key? key,
    required this.child,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      width: screenWidth,
      height: screenHeight,
      decoration: BoxDecoration(
          // gradient: LinearGradient(
          //   begin: Alignment.topCenter,
          //   end: Alignment.bottomCenter,
          //   stops: [0, 0.4, 0.2],
          //   colors: [
          //     Color.fromARGB(255, 144, 142, 142),
          //     Colors.white,
          //     Colors.white,
          //   ],
          // ),
          color: Colors.grey[100]!),
      padding:
          padding != null ? EdgeInsets.all(padding!) : const EdgeInsets.all(32),
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: RadialGradient(
            center: Alignment.topCenter,
            radius: 1.5,
            colors: [
              Colors.white.withOpacity(0.3),
              Colors.white.withOpacity(0),
            ],
          ),
        ),
        child: child,
      ),
    );
  }
}
