import 'package:flutter/material.dart';
import 'package:kulture/constants/app_colors.dart';

class DropdownField extends StatefulWidget {
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
  State<DropdownField> createState() => _DropdownFieldState();
}

class _DropdownFieldState extends State<DropdownField> {
  final FocusNode _focusNode = FocusNode();
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      setState(() {
        _isFocused = _focusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Focus(
      focusNode: _focusNode,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        constraints: const BoxConstraints(minHeight: 40),
        decoration: BoxDecoration(
          border: Border.all(
            color: _isFocused
                ? AppColors.primaryColor
                : AppColors.textFieldBorderColor,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              widget.hint,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: AppColors.searchBarTextColor,
                  ),
            ),
            const SizedBox(height: 2),
            DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                value: widget.value,
                isDense: true,
                icon: const Icon(Icons.keyboard_arrow_down,
                    color: AppColors.searchBarTextColor, size: 20),
                isExpanded: true,
                items: widget.items.map((String item) {
                  return DropdownMenuItem<String>(
                    value: item,
                    child: Text(
                      item,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: AppColors.textblackColor,
                          ),
                    ),
                  );
                }).toList(),
                onChanged: (val) {
                  widget.onChanged(val);
                  // manually request focus to trigger border change
                  _focusNode.requestFocus();
                },
                menuMaxHeight: 300,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
