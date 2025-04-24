import 'package:flutter/material.dart';

import '../widgets/on_click.dart';

class GradientButton extends StatelessWidget {
  const GradientButton({
    super.key,
    required this.onPressed,
    required this.title,
    this.height = 50,
    this.borderRadius = 6,
    this.fontSize = 16,
    this.textColor = Colors.white,
  });

  final VoidCallback onPressed;
  final String title;
  final Color textColor;
  final double height;
  final double fontSize;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return OnClick(
      onTap: onPressed,
      child: Container(
        height: height,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius),
          gradient: LinearGradient(
            colors: [
              const Color(0xff94B9FF),
              const Color(0xff94B9FF),
              const Color(0xff94B9FF).withOpacity(0.8),
              const Color(0xffCDFFD8),
            ],
          ),
        ),
        child: TextButton(
          onPressed: onPressed,
          style: ButtonStyle(
            shape: WidgetStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(borderRadius), // Button border radius
              ),
            ),
          ),
          child: Text(
            title,
            style: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
