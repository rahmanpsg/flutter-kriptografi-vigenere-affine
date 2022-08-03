import 'package:flutter/material.dart';
import 'package:kriptografi_vigenere_affine/themes/app_colors.dart';

class CustomCard extends StatelessWidget {
  final Widget child;
  final Color color;
  final Color shadowColor;

  const CustomCard({
    Key? key,
    required this.child,
    this.color = backgroundColor,
    this.shadowColor = mainColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: color,
        boxShadow: [
          BoxShadow(
            color: shadowColor,
            blurRadius: 1, // soften the shadow
            spreadRadius: 1, //extend the shadow
            offset: const Offset(
              1.0, // Move to right 10  horizontally
              1.0, // Move to bottom 10 Vertically
            ),
          )
        ],
      ),
      padding: const EdgeInsets.all(16),
      child: child,
    );
  }
}
