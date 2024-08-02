import 'package:flutter/material.dart';

class ButtonTime extends StatelessWidget {
  const ButtonTime(
      {super.key,
      required this.icon,
      required this.bgColor,
      this.onTap,
      this.isBig = false});

  final IconData icon;
  final Color bgColor;
  final void Function()? onTap;
  final bool isBig;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: isBig ? 130 : 80,
        height: isBig ? 100 : 80,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          color: bgColor,
        ),
        child: Center(
          child: Icon(
            icon,
            size: isBig ? 50 : 30,
          ),
        ),
      ),
    );
  }
}
