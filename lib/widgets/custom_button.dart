import 'package:flutter/material.dart';
import 'package:qrcode/utils/constants/size_constants.dart';

class CustomRaisedBtn extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget child;
  final Color color;
  final double elevation;
  final double width;
  final double height;
  final double borderRadius;

  CustomRaisedBtn({
    required this.onPressed,
    required this.child,
    required this.color,
    this.elevation = 0.0,
    required this.width,
    required this.height, 
    required this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: width,
        height: height,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: child,
      ),
    );
  }
}
