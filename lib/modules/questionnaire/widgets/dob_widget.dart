import 'package:flutter/material.dart';
import 'package:kulture/constants/app_colors.dart';

class DropdownField extends StatelessWidget {
  final String hint;
  final String? value;
  final List<String> items;
  final Function(String?) onChanged;

  const DropdownField({
    super.key,
    required this.hint,
    required this.value,
    required this.items,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
          horizontal: 12, vertical: 4), // Reduced vertical padding
      constraints: const BoxConstraints(minHeight: 40), // Set minimum height
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[300]!),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            hint,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  fontSize: 14, // Reduced font size for hint
                  fontWeight: FontWeight.w400,
                  color: AppColors.searchBarTextColor,
                ),
          ),
          const SizedBox(
              height: 2), // Reduced spacing between hint and dropdown
          DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: value,
              isDense: true, // Makes the dropdown more compact
              hint: const Text(''),
              icon: const Icon(Icons.keyboard_arrow_down,
                  color: AppColors.searchBarTextColor,
                  size: 20), // Smaller icon
              isExpanded: true,
              items: items.map((String item) {
                return DropdownMenuItem<String>(
                  value: item,
                  child: Text(
                    item,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          fontSize: 14, // Slightly reduced font size
                          fontWeight: FontWeight.w400,
                          color: AppColors.textblackColor,
                        ),
                  ),
                );
              }).toList(),
              onChanged: onChanged,
            ),
          ),
        ],
      ),
    );
  }
}
