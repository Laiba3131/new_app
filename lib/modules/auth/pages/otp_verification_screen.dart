import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:kulture/constants/app_colors.dart';
import 'package:kulture/constants/app_text_styles.dart';
import 'package:kulture/modules/auth/pages/new_password_screen.dart';
import 'package:kulture/modules/auth/pages/signup_screen.dart';
import 'package:kulture/modules/onBoarding/pages/pre_profile_edit.dart';
import 'package:kulture/ui/button/primary_button.dart';
import 'package:kulture/ui/input/input_field.dart';
import 'package:kulture/utils/extensions/extended_context.dart';
import 'package:kulture/utils/heights_and_widths.dart';

class OtpVerificationScreen extends StatefulWidget {

  OtpVerificationScreen({super.key});

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();
  String _enteredOtp = "";

  void _onOtpCompleted(String otp) {
    setState(() {
      _enteredOtp = otp;
    });
  }

  @override
  Widget build(BuildContext context) {
        bool isOtpComplete = _enteredOtp.length == 6;

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
                'OTP Verification',
                style: context.textTheme.bodySmall?.copyWith(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: AppColors.black,
                ),
              ),
              Text(
                'Enter in the verification code we just sent to your email.',
                style: context.textTheme.bodySmall?.copyWith(
                  fontSize: 13,
                  fontWeight: FontWeight.w300,
                  color: AppColors.black,
                ),
              ),
              h3,
              OtpTextField(
                numberOfFields: 6,
                cursorColor: Colors.black,
                textStyle: const TextStyle(
                  color: AppColors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w900,
                ),
                borderRadius: BorderRadius.circular(8),
                fieldWidth: 45,
                filled: true,
                // fillColor: Colors.black,
                
                borderColor:AppColors.searchBarColor,
                focusedBorderColor:AppColors.searchBarColor,
                enabledBorderColor:AppColors.searchBarColor,
                showFieldAsBox: true,
                contentPadding: const EdgeInsets.symmetric(vertical: 15),
                onSubmit: _onOtpCompleted,
              ),
              h2,
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      textAlign: TextAlign.right,
                      'Resend OPT in 60s',
                      style: context.textTheme.bodySmall?.copyWith(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: AppColors.black,
                      ),
                    ),
                  ],
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
                        builder: (context) => NewPasswordScreen(),
                      ),
                    );
                  },
                  title: 'Send code',
                  backgroundColor:isOtpComplete? AppColors.primaryColor:AppColors.disableColor,
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
