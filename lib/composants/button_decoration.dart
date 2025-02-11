import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Color borderColor;
  final Color bgColor;
  final Color txtColor;
  final double paddingHorizontal;
  final double fontSize;
  final VoidCallback onPressed;

  const CustomButton({
    super.key,
    required this.text,
    required this.borderColor,
    required this.bgColor,
    required this.txtColor,
    this.paddingHorizontal = 23,
    this.fontSize = 18,
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

      child: Text(
        text,
        style: TextStyle(color: txtColor, fontSize: fontSize),
      ),
    );
  }
}
