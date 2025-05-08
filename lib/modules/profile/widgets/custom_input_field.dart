import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kulture/constants/app_colors.dart';
import 'package:kulture/generated/assets.dart';
import 'package:kulture/utils/heights_and_widths.dart';
import 'package:kulture/utils/validators/validators.dart';

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
  final FormFieldValidator<String>? validator;
  final bool isReadOnly;
  final TextInputType keyboardType;
   final List<TextInputFormatter>? inputFormatters;

  const CustomInputField({
    super.key,
    required this.title,
    required this.hintText,
    required this.controller,
    this.minLines = 1,
    this.maxLines = 1,
    this.inputType = TextInputType.text,
    this.onChanged,
    this.validator,
    this.iconPath,
    required this.fun,
    this.textColor,
    this.isReadOnly = false,
    this.keyboardType = TextInputType.text,
    this.inputFormatters,
  });

  @override
  Widget build(BuildContext context) {
    final iconWidget = iconPath != null
        ? Image.asset(iconPath!, height: 20, width: 20)
        : const SizedBox.shrink();
//  final validator =
//         validator ?? Validators.getValidator(keyboardType);
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
        TextFormField(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: validator,
          readOnly: isReadOnly,
          controller: controller,
          keyboardType: inputType,
          minLines: minLines,
          maxLines: maxLines,
           inputFormatters: inputFormatters,
          decoration: InputDecoration(
            errorStyle: const TextStyle(
              color: AppColors.red,
            ),
            hintText: hintText,
            hintStyle: const TextStyle(
              color: Colors.grey,
              fontSize: 14,
            ),
            prefixIcon: Padding(
              padding: const EdgeInsets.only(right: 7.0),
              child: InkWell(
                onTap: fun,
                child: iconWidget),
            ),
            prefixIconConstraints: const BoxConstraints(
              minWidth: 0,
              minHeight: 0,
            ),
            isDense: true,
            contentPadding:
                const EdgeInsets.only(top: 14, bottom: 14, right: 5),
            filled: true,
            fillColor: Colors.white,
            border: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent),
            ),
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: AppColors.searchBarColor),
            ),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: AppColors.searchBarColor, width: 2),
            ),
            focusedErrorBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: AppColors.searchBarColor),
            ),
            errorBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: AppColors.searchBarColor),
            ),
            disabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: AppColors.searchBarColor),
            ),
          ),
          style: TextStyle(
            height: 1.5,
            fontSize: 14,
            color: textColor ?? Colors.black,
          ),
          onChanged: onChanged,
        ),
        h2,
        // const Divider(
        //   height: 32,
        //   color: AppColors.lightGreyColor,
        // ),
      ],
    );
  }
}
