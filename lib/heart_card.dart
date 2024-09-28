import 'package:flutter/material.dart';

class HeartCard extends StatelessWidget {
  final Widget child;

  const HeartCard({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: HeartClipper(),
      child: child,
    );
  }
}

class HeartClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path()
      ..moveTo(size.width, size.height / 4)
      ..close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
