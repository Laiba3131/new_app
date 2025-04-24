import 'package:flutter/material.dart';
import 'package:kulture/constants/app_colors.dart';
import 'package:kulture/constants/app_text_styles.dart';
import 'package:kulture/modules/auth/pages/otp_verification_screen.dart';
import 'package:kulture/modules/auth/pages/signup_screen.dart';
import 'package:kulture/modules/onBoarding/pages/pre_profile_edit.dart';
import 'package:kulture/ui/button/primary_button.dart';
import 'package:kulture/ui/input/input_field.dart';
import 'package:kulture/utils/extensions/extended_context.dart';
import 'package:kulture/utils/heights_and_widths.dart';

class NewPasswordScreen extends StatefulWidget {
  const NewPasswordScreen({super.key});

  @override
  State<NewPasswordScreen> createState() => _NewPasswordScreenState();
}

class _NewPasswordScreenState extends State<NewPasswordScreen> {
  TextEditingController confirmPasswordController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  bool isObscure = true;

  bool isObscureConfirm = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              h10,
              Text(
                'New Password',
                style: context.textTheme.bodySmall?.copyWith(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: AppColors.black,
                ),
                // style: AppTextStyles.interRegular(
                //   fontSize: 24,
                //   fontWeight: FontWeight.w700,
                //   color: AppColors.black,
                // ),
              ),
              Text(
                'Please enter your new password below',
                style: context.textTheme.bodySmall?.copyWith(
                  fontSize: 13,
                  fontWeight: FontWeight.w300,
                  color: AppColors.black,
                ),
                // style: AppTextStyles.interRegular(
                //   fontSize: 13,
                //   fontWeight: FontWeight.w300,
                //   color: AppColors.black,
                // ),
              ),
              h3,
              Text(
                'New password',
                style: context.textTheme.bodySmall?.copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: AppColors.black,
                ),
                // style: AppTextStyles.interRegular(
                //   fontSize: 16,
                //   fontWeight: FontWeight.w400,
                //   color: AppColors.black,
                // ),
              ),
              h0P5,
              InputField(
                fillColor: AppColors.black,
                controller: passwordController,
                label: "Enter your password...",
                boxConstraints: 18.0,
                hintColor: Colors.white,
                borderRadius: 8.0,
                textColor: Colors.white,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  return null;
                },
                obscureText: isObscure,
                suffixIcon: InkWell(
                  onTap: () {
                    setState(() {
                      isObscure = !isObscure;
                    });
                  },
                  child: isObscure
                      ? const Icon(Icons.visibility_off_outlined,
                          color: AppColors.white)
                      : const Icon(Icons.visibility_outlined,
                          color: AppColors.white),
                ),
              ),
              h1,
              Text(
                'Confirm password',
                style: context.textTheme.bodySmall?.copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: AppColors.black,
                ),
                // style: AppTextStyles.interRegular(
                //   fontSize: 16,
                //   fontWeight: FontWeight.w400,
                //   color: AppColors.black,
                // ),
              ),
              h0P5,
              InputField(
                fillColor: AppColors.black,
                controller: confirmPasswordController,
                label: "Confirm your password...",
                boxConstraints: 18.0,
                hintColor: Colors.white,
                borderRadius: 8.0,
                textColor: Colors.white,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  return null;
                },
                obscureText: isObscureConfirm,
                suffixIcon: InkWell(
                  onTap: () {
                    setState(() {
                      isObscureConfirm = !isObscureConfirm;
                    });
                  },
                  child: isObscureConfirm
                      ? const Icon(Icons.visibility_off_outlined,
                          color: AppColors.white)
                      : const Icon(Icons.visibility_outlined,
                          color: AppColors.white),
                ),
              ),
              h4,
              PrimaryButton(
                  height: 45,
                  vMargin: 0,
                  hMargin: 0,
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SignupScreen(),
                      ),
                    );
                  },
                  title: 'Change Password',
                  backgroundColor: AppColors.primaryColor,
                  titleColor: AppColors.white,
                  borderRadius: 25,
                  shadowColor: AppColors.transparent),
            ],
          ),
        ),
      ),
    );
  }
}
