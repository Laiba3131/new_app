import 'package:flutter/material.dart';
import 'package:kulture/config/config.dart';
import 'package:kulture/constants/app_colors.dart';
import 'package:kulture/modules/auth/pages/signup_screen.dart';
import 'package:kulture/ui/button/primary_button.dart';
import 'package:kulture/ui/input/input_field.dart';
import 'package:kulture/utils/extensions/extended_context.dart';
import 'package:kulture/utils/heights_and_widths.dart';
import 'package:kulture/utils/validators/validators.dart';

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
  bool areAllFieldsFilled = false;

@override
  void initState() {
    super.initState();
    passwordController.addListener(_onFieldChanged);
    confirmPasswordController.addListener(_onFieldChanged);
  }

void _onFieldChanged() {
    setState(() {
      areAllFieldsFilled = 
         
          passwordController.text.isNotEmpty &&
          confirmPasswordController.text.isNotEmpty;
    });
  }

    @override
  void dispose() {
    passwordController.removeListener(_onFieldChanged);
    confirmPasswordController.removeListener(_onFieldChanged);
    passwordController.dispose();
    confirmPasswordController.dispose();
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
                            controller: passwordController,
                            label: "Password",
                            boxConstraints: 18.0,
                           borderColor: AppColors.searchBarColor,
                            hintColor: AppColors.searchBarTextColor,
                            borderRadius: 16.0,
                            textColor: Colors.black,
                            validator: (value) {
                            return  Validators.password(value);
                              
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
                // style: AppTextStyles.interRegular(
                //   fontSize: 16,
                //   fontWeight: FontWeight.w400,
                //   color: AppColors.black,
                // ),
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
                            return  Validators.confirmPassword(confirmPasswordController.text, passwordController.text);
                            
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
                    NavRouter.push(context, const SignupScreen());
                  },
                  title: 'Change Password',
                  backgroundColor:areAllFieldsFilled? AppColors.primaryColor:
                    AppColors.disableColor,
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
