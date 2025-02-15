import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Color borderColor;
  final Color bgColor;
  final Color txtColor;
  final double paddingHorizontal;
  final double fontSize;
  final Widget? image;
  final VoidCallback onPressed;

  const CustomButton({
    super.key,
    required this.text,
    required this.borderColor,
    required this.bgColor,
    required this.txtColor,
    this.paddingHorizontal = 23,
    this.fontSize = 18,
    this.image,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,

      style: ElevatedButton.styleFrom(
        backgroundColor: bgColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: BorderSide(color: borderColor, width: 2),
        ),
        padding: EdgeInsets.symmetric(horizontal: paddingHorizontal, vertical: 12),
      ),

      child: Row(
        mainAxisSize: MainAxisSize.min, // Pour que le Row ne prenne pas toute la largeur
        children: [
          Text(
            text,
            style: TextStyle(color: txtColor, fontSize: fontSize),
          ),
          const SizedBox(width: 10,),
          if (image != null) image!,
          if (image != null) const SizedBox(width: 8),
        ],
      ),
    );
  }
}
