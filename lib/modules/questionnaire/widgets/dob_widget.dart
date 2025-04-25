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
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
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
                  fontSize: 17,
                  fontWeight: FontWeight.w400,
                  color: AppColors.searchBarTextColor,
                ),
          ),
          DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: value,
              hint: Text(
                '',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      fontSize: 17,
                      fontWeight: FontWeight.w400,
                      color: AppColors.searchBarTextColor,
                    ),
              ),
              icon: Icon(Icons.keyboard_arrow_down, color: Colors.grey[700]),
              isExpanded: true,
              items: items.map((String item) {
                return DropdownMenuItem<String>(
                  value: item,
                  child: Text(
                    item,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          fontSize: 15,
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
