import 'package:flutter/material.dart';
import 'package:kulture/constants/app_colors.dart';
import 'package:kulture/generated/assets.dart';

class CustomInputField extends StatelessWidget {
  final String title;
  final String hintText;
  final TextEditingController controller;
  final int minLines;
  final int maxLines;
  final TextInputType inputType;
  final Function(String)? onChanged;
  final String? iconPath;
  final Color? textColor;
  final VoidCallback fun;
  final bool isReadOnly;

  const CustomInputField({
    super.key,
    required this.title,
    required this.hintText,
    required this.controller,
    this.minLines = 1,
    this.maxLines = 1,
    this.inputType = TextInputType.text,
    this.onChanged,
    this.iconPath,
    required this.fun,
    this.textColor,
    this.isReadOnly = false,
  });

  @override
  Widget build(BuildContext context) {
    final iconWidget = iconPath != null
        ? Image.asset(iconPath!, height: 20, width: 20)
        : const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 8),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            iconWidget,
            const SizedBox(width: 8),
            Expanded(
              child: TextField(
                readOnly: isReadOnly,
                controller: controller,
                keyboardType: inputType,
                minLines: minLines,
                maxLines: maxLines,
                decoration: InputDecoration(
                  hintText: hintText,
                  hintStyle: const TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.zero,
                  filled: true,
                  fillColor: Colors.white,
                ),
                style: TextStyle(
                  height: 1.5,
                  fontSize: 14,
                  color: textColor ?? Colors.black,
                ),
                onChanged: onChanged,
              ),
            ),
          ],
        ),
        const Divider(
          height: 32,
          color: AppColors.lightGreyColor,
        ),
      ],
    );
  }
}
