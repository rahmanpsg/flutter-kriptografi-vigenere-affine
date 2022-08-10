import 'package:flutter/material.dart';
import 'package:kriptografi_vigenere_affine/themes/app_colors.dart';
import 'package:kriptografi_vigenere_affine/themes/app_text.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final String imageAsset;
  final Color color;
  final Color textColor;

  const CustomButton({
    Key? key,
    required this.text,
    required this.onTap,
    required this.imageAsset,
    this.color = secondaryColor,
    this.textColor = backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Ink(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: color,
        ),
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Image.asset(
              imageAsset,
              width: 50,
            ),
            const SizedBox(width: 16),
            Flexible(
              child: Text(
                text,
                style: boldTextStyle.copyWith(
                  fontSize: 18,
                  color: textColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
