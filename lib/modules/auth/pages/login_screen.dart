import 'package:flutter/material.dart';
import 'package:kulture/config/routes/nav_router.dart';
import 'package:kulture/constants/app_colors.dart';
import 'package:kulture/constants/app_text_styles.dart';
import 'package:kulture/generated/assets.dart';
import 'package:kulture/modules/auth/pages/forgot_password_screen.dart';
import 'package:kulture/modules/auth/pages/signup_screen.dart';
import 'package:kulture/ui/button/primary_button.dart';
import 'package:kulture/ui/input/input_field.dart';
import 'package:kulture/utils/extensions/extended_context.dart';
import 'package:kulture/utils/heights_and_widths.dart';
import 'package:kulture/modules/onBoarding/pages/pre_profile_edit.dart';
import 'package:sizer/sizer.dart';

class LoginScreen extends StatelessWidget {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isAuthenticated = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Center(
                child: Image.asset(
                  Assets.pngSplashLogo1,
                  width: 100,
                  height: 100,
                ),
              ),
            ),
            SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: MediaQuery.of(context).size.height,
                ),
                child: IntrinsicHeight(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 5.0, horizontal: 15),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        h2,
                        Center(
                          child: Image.asset(
                            Assets.pngSplashLogo,
                            width: 150,
                            height: 150,
                          ),
                        ),
                        Center(
                          child: Text(
                            'Welcome back',
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
                        ),
                        Center(
                          child: Text(
                            'Please enter your details to sign in',
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
                        ),
                        h2,
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                child: _buildSocialButton(
                                    Assets.pngTwitter, AppColors.searchBarColor),
                              ),
                              w1,
                              Expanded(
                                child: _buildSocialButton(
                                    Assets.pngInsta, AppColors.searchBarColor),
                              ),
                              w1,
                              Expanded(
                                child: _buildSocialButton(
                                    Assets.pngTiktok, AppColors.searchBarColor),
                              )
                            ],
                          ),
                        ),
                        h4,
                        InputField(
                          // fillColor: AppColors.black,
                          controller: emailController,
                          label: "Email address",
                          boxConstraints: 18.0,
                          borderColor: AppColors.searchBarColor,
                          hintColor: AppColors.searchBarTextColor,
                          borderRadius: 16.0,
                          textColor: Colors.white,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter an email';
                            } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+')
                                .hasMatch(value)) {
                              return 'Enter a valid email';
                            }
                            return null;
                          },
                        ),
                        h1,
                        InputField(
                          // fillColor: AppColors.black,
                          controller: passwordController,
                          label: "Password",
                          boxConstraints: 18.0,
                          borderColor: AppColors.searchBarColor,
                          hintColor: AppColors.searchBarTextColor,
                          borderRadius: 16.0,
                          textColor: Colors.white,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your password';
                            }
                            return null;
                          },
                        ),
                        h0P8,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            InkWell(
                              onTap: () {
                                NavRouter.push(context, ForgotPasswordScreen());
                              },
                              child: Text(
                                'Forgotten password?',
                                style: context.textTheme.bodySmall?.copyWith(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.black,
                                ),
                              ),
                            ),
                          ],
                        ),
                        h2,
                        PrimaryButton(
                            height: 45,
                            vMargin: 0,
                            hMargin: 0,
                            onPressed: () {
                              // Perform login action here
                              String email = emailController.text.trim();
                              String password = passwordController.text.trim();

                              if (email.isEmpty || password.isEmpty) {
                                _showErrorDialog(context);
                               
                              } else {
                                 isAuthenticated = true;
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const PreProfileEditPage(),
                                  ),
                                );
                                // Call your login function here
                                // For example: login(email, password);
                              }
                            },
                            title: 'Log in',
                            backgroundColor: (emailController.text.isEmpty && passwordController.text.isNotEmpty) ? AppColors.primaryColor:AppColors.disableColor,
                            titleColor: AppColors.white,
                            borderRadius: 25,
                            shadowColor: AppColors.transparent),
                        h1,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Don't have an",
                                style: context.textTheme.bodySmall?.copyWith(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.black)),
                            w1,
                            InkWell(
                              onTap: () {
                                NavRouter.push(context, const SignupScreen());
                              },
                              child: Text("account?",
                                  style: context.textTheme.bodySmall?.copyWith(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.blue)),
                            ),
                          ],
                        ),
                        h5,
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSocialButton(String icon, Color color) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.searchBarColor, width: 1),
      ),
      child: Center(
        child: Image.asset(
          icon,
          width: 35,
          height: 35,
          color: AppColors.black,
        ),
      ),
    );
  }

  void _showErrorDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          backgroundColor: AppColors.lightGreyColor,
          child: Container(
            constraints: const BoxConstraints(maxWidth: 300),
            padding: const EdgeInsets.symmetric(vertical: 23.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Text(
                    'Incorrect password or email',
                    style: context.textTheme.bodySmall?.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: AppColors.black,
                    ),
                    // style: AppTextStyles.interRegular(
                    //   fontSize: 16,
                    //   fontWeight: FontWeight.w600,
                    //   color: AppColors.black,
                    // ),
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Text(
                    textAlign: TextAlign.center,
                    'The Password or email you entered is incorrect. Please try again.',
                    style: context.textTheme.bodySmall?.copyWith(
                      fontSize: 14,
                      // fontWeight: FontWeight.w300,
                      color: AppColors.black,
                    ),
                    // style: AppTextStyles.interRegular(
                    //   fontSize: 14,
                    //   color: AppColors.black,
                    // ),
                  ),
                ),
                h2,
                const Divider(
                  color: AppColors.greyColor,
                ),
                h1,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: InkWell(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Text(
                        'OK',
                        style: context.textTheme.bodySmall?.copyWith(
                            fontSize: 15,
                            fontWeight: FontWeight.w800,
                            color: AppColors.blue),
                      )),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
