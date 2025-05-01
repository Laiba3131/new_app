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
import 'package:kulture/utils/validators/validators.dart';

class ForgotPasswordScreen extends StatefulWidget {
  ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();
  bool isEmailFilled = false;
  @override
  void initState() {
    super.initState();
    emailController.addListener(_onEmailChanged);
  }

  void _onEmailChanged() {
    setState(() {
      isEmailFilled = emailController.text.isNotEmpty;
    });
  }

  @override
  void dispose() {
    emailController.removeListener(_onEmailChanged);
    emailController.dispose();
    super.dispose();
  }

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
                horizontalPadding: 0,
                focusBorderColor:AppColors.primaryColor,
                controller: emailController,
                label: "Email address",
                boxConstraints: 18.0,
                borderColor: AppColors.primaryColor,
                hintColor: AppColors.searchBarTextColor,
                borderRadius: 16.0,
                textColor: Colors.black,
                validator: (value) {
                  return Validators.email(
                    emailController.text,
                  );
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
                  backgroundColor: isEmailFilled
                      ? AppColors.primaryColor
                      : AppColors.disableColor,
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
