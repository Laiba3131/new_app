import 'package:flutter/material.dart';

class CustomSwitchTile extends StatelessWidget {
  final String title;
  final bool value;
  final void Function(bool)? onChanged;
  final String? descriptionOn;
  final String? descriptionOff;
  final Color activeColor;
  final Color activeTrackColor;
  final Color inactiveThumbColor;
  final Color inactiveTrackColor;

  const CustomSwitchTile({
    super.key,
    required this.title,
    required this.value,
    required this.onChanged,
    this.descriptionOn,
    this.descriptionOff,
    this.activeColor = Colors.white,
    this.activeTrackColor = Colors.black,
    this.inactiveThumbColor = Colors.white,
    this.inactiveTrackColor = const Color(0xFFE0E0E0),
  });

  @override
  Widget build(BuildContext context) {
    final description = value ? descriptionOn : descriptionOff;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            Switch(
              value: value,
              onChanged: onChanged,
              activeColor: activeColor,
              activeTrackColor: activeTrackColor,
              inactiveThumbColor: inactiveThumbColor,
              inactiveTrackColor: inactiveTrackColor,
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
          ],
        ),
        if (description != null)
          Text(
            description,
            style: const TextStyle(
              fontSize: 14,
              color: Color(0xFF9E9E9E),
            ),
          ),
      ],
    );
  }
}
