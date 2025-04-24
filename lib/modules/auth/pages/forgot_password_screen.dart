import 'package:flutter/material.dart';
import 'package:kulture/constants/app_colors.dart';
import 'package:kulture/constants/app_text_styles.dart';
import 'package:kulture/modules/auth/pages/new_password_screen.dart';
import 'package:kulture/modules/auth/pages/otp_verification_screen.dart';
import 'package:kulture/modules/onBoarding/pages/pre_profile_edit.dart';
import 'package:kulture/ui/button/primary_button.dart';
import 'package:kulture/ui/input/input_field.dart';
import 'package:kulture/utils/extensions/extended_context.dart';
import 'package:kulture/utils/heights_and_widths.dart';

class ForgotPasswordScreen extends StatelessWidget {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  ForgotPasswordScreen({super.key});
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
                'Forgot Password ',
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
                'Enter your email here and a 6 digit code opt code will be sent.',
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
                'Email',
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
                controller: emailController,
                label: "Enter your email...",
                boxConstraints: 18.0,
                hintColor: Colors.white,
                borderRadius: 8.0,
                textColor: Colors.white,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter an email';
                  } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                    return 'Enter a valid email';
                  }
                  return null;
                },
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
                        builder: (context) => OtpVerificationScreen(),
                      ),
                    );
                  },
                  title: 'Send code',
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
