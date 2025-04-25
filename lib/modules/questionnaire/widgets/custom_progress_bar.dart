import 'package:flutter/material.dart';

class CustomProgressBar extends StatelessWidget {
  final List<Color> segmentColors;
  final List<int> flexValues;
  final double height;
  final double spacing;

  const CustomProgressBar({
    Key? key,
    required this.segmentColors,
    required this.flexValues,
    this.height = 7,
    this.spacing = 8,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 8),
      height: height,
      child: Row(
        children: List.generate(segmentColors.length * 2 - 1, (index) {
          if (index.isOdd) {
            return SizedBox(width: spacing);
          } else {
            final realIndex = index ~/ 2;
            return Expanded(
              flex: flexValues[realIndex],
              child: Container(
                decoration: BoxDecoration(
                  color: segmentColors[realIndex],
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
            );
          }
        }),
      ),
    );
  }
}
