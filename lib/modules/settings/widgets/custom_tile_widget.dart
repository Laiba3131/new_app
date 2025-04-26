import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kulture/app/cubit/app_cubit.dart';
import 'package:kulture/constants/app_colors.dart';
import 'package:kulture/generated/assets.dart';
import 'package:kulture/utils/extensions/extended_context.dart';

class CustomTileWidget extends StatelessWidget {
  final String title;
  final bool value;
  final bool isLogout;
  final bool isBorder;
  final bool isSwitch;
  VoidCallback? fun;
  final ValueChanged<bool>? onChanged;
  final String? icon;

  CustomTileWidget({
    Key? key,
    required this.title,
    this.value = true,
    this.isLogout = true,
    this.isBorder = true,
    this.isSwitch = true,
    this.onChanged,
    this.icon,
    this.fun,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: fun,
      child: Container(
        height: 56,
        padding: const EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: isBorder ? AppColors.textGrey : AppColors.transparent,
              width: 0.5,
            ),
          ),
        ),
        child: Row(
          children: [
            if (icon != null) ...[
              SvgPicture.asset(
                icon!,
                // height: 24,
                // width: 24,
              ),
              const SizedBox(width: 12),
            ],
            Expanded(
              child: Text(title,
                  style: context.textTheme.bodySmall?.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: isLogout ? AppColors.black : AppColors.red)),
            ),
            if (isSwitch && onChanged != null)
              Switch(
                value: value,
                onChanged: onChanged!,
                activeColor: Colors.white,
                activeTrackColor: AppColors.black,
                inactiveThumbColor: AppColors.white,
                inactiveTrackColor: const Color(0xFFE0E0E0),
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              )
            else if (!isSwitch)
              const Icon(Icons.chevron_right, color: AppColors.black),
          ],
        ),
      ),
    );
  }
}
