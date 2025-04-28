import 'package:flutter/material.dart';
import 'package:kulture/constants/app_colors.dart';
import 'package:kulture/ui/input/input_field.dart';

class SearchableDropdownField extends StatefulWidget {
  final String title;
  final TextEditingController controller;
  final List<String> items;
  final Function(String) onFilter;
  final Function(String) onSelect;
  final FocusNode? focusNode;

  const SearchableDropdownField({
    super.key,
    required this.title,
    required this.controller,
    required this.items,
    required this.onFilter,
    required this.onSelect,
    this.focusNode,
  });

  @override
  State<SearchableDropdownField> createState() =>
      _SearchableDropdownFieldState();
}

class _SearchableDropdownFieldState extends State<SearchableDropdownField> {
  bool _isOpen = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            setState(() => _isOpen = !_isOpen);
          },
          child: Container(
            padding: const EdgeInsets.only(left: 12, top: 12),
            decoration: BoxDecoration(
              border: Border.all(
                  color: _isOpen
                      ? AppColors.primaryColor
                      : AppColors.textFieldBorderColor),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.title,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontSize: 17,
                        fontWeight: FontWeight.w400,
                        color: AppColors.searchBarTextColor,
                      ),
                ),
                InputField(
                  controller: widget.controller,
                  label: '',
                  // readOnly: true,
                  focusNode: widget.focusNode,
                  prefixIcon: const Icon(
                    Icons.search,
                    size: 26,
                    color: AppColors.searchBarTextColor,
                  ),
                  horizontalPadding: 0,
                  onChange: (value) {
                    widget.onFilter(value);
                    setState(() => _isOpen = true);
                  },
                  onTap: () {
                    setState(() => _isOpen = true);
                  },
                  lMargin: 0,
                ),
              ],
            ),
          ),
        ),
        if (_isOpen)
          Container(
            constraints: const BoxConstraints(maxHeight: 150),
            decoration: const BoxDecoration(
              border: Border(
                left: BorderSide(color: AppColors.primaryColor),
                right: BorderSide(color: AppColors.primaryColor),
                bottom: BorderSide(color: AppColors.primaryColor),
              ),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(8),
                bottomRight: Radius.circular(8),
              ),
            ),
            child: ListView.builder(
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              itemCount: widget.items.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    widget.onSelect(widget.items[index]);
                    widget.controller.text = widget.items[index];
                    setState(() => _isOpen = false);
                    FocusScope.of(context).unfocus();
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 7,
                      horizontal: 16,
                    ),
                    child: Text(
                      widget.items[index],
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            fontSize: 17,
                            fontWeight: FontWeight.w400,
                            color: AppColors.textblackColor,
                          ),
                    ),
                  ),
                );
              },
            ),
          ),
      ],
    );
  }
}
