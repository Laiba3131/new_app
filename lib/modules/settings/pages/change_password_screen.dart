import 'package:flutter/material.dart';
import 'package:kulture/constants/app_colors.dart';
import 'package:kulture/modules/auth/pages/otp_verification_screen.dart';
import 'package:kulture/ui/button/primary_button.dart';
import 'package:kulture/ui/input/input_field.dart';
import 'package:kulture/utils/extensions/extended_context.dart';
import 'package:kulture/utils/heights_and_widths.dart';
import 'package:kulture/utils/validators/validators.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  TextEditingController confirmPasswordController = TextEditingController();

  TextEditingController passwordController = TextEditingController();
  TextEditingController oldPasswordController = TextEditingController();

  bool isObscure = true;

  bool isObscureConfirm = true;
  bool isoldObscureConfirm = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                h10,
                Text(
                  'Change Password',
                  style: context.textTheme.bodySmall?.copyWith(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    color: AppColors.black,
                  ),
                ),
                Text(
                  'Please enter your new password below',
                  style: context.textTheme.bodySmall?.copyWith(
                    fontSize: 13,
                    fontWeight: FontWeight.w300,
                    color: AppColors.black,
                  ),
                ),
                h3,
                Text(
                  'Old password',
                  style: context.textTheme.bodySmall?.copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: AppColors.black,
                  ),
                ),
                h0P5,
                InputField(
                  controller: oldPasswordController,
                  label: "Password",
                  boxConstraints: 18.0,
                  borderColor: AppColors.searchBarColor,
                  hintColor: AppColors.searchBarTextColor,
                  borderRadius: 16.0,
                  textColor: Colors.black,
                  validator: (value) {
                    return Validators.password(value);
                  },
                  obscureText: isoldObscureConfirm,
                  suffixIcon: InkWell(
                    onTap: () {
                      setState(() {
                        isoldObscureConfirm = !isoldObscureConfirm;
                      });
                    },
                    child: isoldObscureConfirm
                        ? const Icon(Icons.visibility_off_outlined,
                            color: AppColors.black)
                        : const Icon(Icons.visibility_outlined,
                            color: AppColors.black),
                  ),
                ),
                h1,
                Text(
                  'New password',
                  style: context.textTheme.bodySmall?.copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: AppColors.black,
                  ),
                ),
                h0P5,
                InputField(
                  controller: passwordController,
                  label: "Password",
                  boxConstraints: 18.0,
                  borderColor: AppColors.searchBarColor,
                  hintColor: AppColors.searchBarTextColor,
                  borderRadius: 16.0,
                  textColor: Colors.black,
                  validator: (value) {
                    return Validators.password(value);
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
                            color: AppColors.black)
                        : const Icon(Icons.visibility_outlined,
                            color: AppColors.black),
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
                ),
                h0P5,
                InputField(
                  controller: confirmPasswordController,
                  label: "Confirm password",
                  boxConstraints: 18.0,
                  borderColor: AppColors.searchBarColor,
                  hintColor: AppColors.searchBarTextColor,
                  borderRadius: 16.0,
                  textColor: Colors.black,
                  validator: (value) {
                    return Validators.confirmPassword(
                        confirmPasswordController.text,
                        passwordController.text);
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
                            color: AppColors.black)
                        : const Icon(Icons.visibility_outlined,
                            color: AppColors.black),
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
                          builder: (context) => OtpVerificationScreen(),
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
      ),
    );
  }
}
