import 'package:flutter/material.dart';

class TextCheckBox extends StatelessWidget {
  final bool isSelected;
  final String text;
  final double fontSize;
  final bool isUnderlineText;
  final double gapWithTitle;

  final Function(bool?) onChanged;

  const TextCheckBox(
      {super.key,
      required this.isSelected,
      required this.onChanged,
      this.isUnderlineText = false,
      required this.text,
      this.fontSize = 14,
      this.gapWithTitle = 10});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 24.0,
          width: 24.0,
          child: Checkbox(
            checkColor: Colors.white,
            value: isSelected,
            onChanged: onChanged,
            side: const BorderSide(
              width: 1,
              color: Colors.black,
            ),
            shape: RoundedRectangleBorder(
              side:
                  const BorderSide(color: Colors.black), // Outline border color
              borderRadius: BorderRadius.circular(4.0),
            ),

            activeColor: Colors.black, // Check color
          ),
        ),
        SizedBox(
          width: gapWithTitle,
        ),
        Expanded(
          child: Text(
            text,
            style: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.w500,
                color: Colors.black.withOpacity(0.75),
                decoration: isUnderlineText ? TextDecoration.underline : null),
          ),
        ),
      ],
    );
  }
}
