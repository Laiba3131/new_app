import 'package:kulture/constants/app_colors.dart';
import 'package:kulture/ui/button/primary_button.dart';
import 'package:kulture/utils/extensions/colors_extension.dart';
import 'package:flutter/material.dart';

export 'api_endpoints.dart';
export 'app_colors.dart';
export 'asset_paths.dart';
export 'keys.dart';

double buttonHeight = 55.0;
double formTextFieldHeight = 50.0;

Widget CustomButton(BuildContext context, fun) {
  return PrimaryButton(
    height: 52,
    vMargin: 0,
    hMargin: 0,
    onPressed: fun,
    title: 'Next',
    backgroundColor: context.primaryColor,
    titleColor: AppColors.white,
    borderRadius: 25,
  );
}
