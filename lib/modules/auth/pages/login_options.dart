import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kulture/app/cubit/app_cubit.dart';
import 'package:kulture/config/routes/nav_router.dart';
import 'package:kulture/constants/app_colors.dart';
import 'package:kulture/constants/app_text_styles.dart';
import 'package:kulture/generated/assets.dart';
import 'package:kulture/modules/auth/pages/login_screen.dart';
import 'package:kulture/modules/auth/pages/signup_screen.dart';
import 'package:kulture/utils/extensions/extended_context.dart';
import 'package:kulture/utils/heights_and_widths.dart';
import 'package:sizer/sizer.dart';

class LoginOptions extends StatefulWidget {
  const LoginOptions({super.key});

  @override
  State<LoginOptions> createState() => _LoginOptionsState();
}

class _LoginOptionsState extends State<LoginOptions> {
  bool isLoginSelected = true;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  h6,
                  Image.asset(
                    Assets.pngSplashLogo,
                    width: 150,
                    height: 150,
                  ),
                  h4,
                  Text(
                    '“This app is powered by Kultureapp, but we want you to make it your own! Be kind, create content you and your friends will love, and most importantly—have fun!”',
                    textAlign: TextAlign.center,
                    style: context.textTheme.bodySmall?.copyWith(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      // color: AppColors.textGrey,
                    ),
                  ),
                ],
              ),
              // BlocBuilder<AppCubit, AppState>(
              //   builder: (context, state) {
              //     return DropdownButton<ThemeMode>(
              //       value: state.themeMode,
              //       onChanged: (newMode) {
              //         if (newMode != null) {
              //           context.read<AppCubit>().updateThemeMode(newMode);
              //         }
              //       },
              //       items: const [
              //         DropdownMenuItem(
              //           value: ThemeMode.light,
              //           child: Text("Light Mode"),
              //         ),
              //         DropdownMenuItem(
              //           value: ThemeMode.dark,
              //           child: Text("Dark Mode"),
              //         ),
              //         DropdownMenuItem(
              //           value: ThemeMode.system,
              //           child: Text("System Default"),
              //         ),
              //       ],
              //     );
              //   },
              // ),
              // // Login / Signup toggle and footer
              Column(
                children: [
                  // Toggle Buttons
                  Container(
                    height: 56,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: AppColors.borderColor),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              setState(() => isLoginSelected = true);
                              NavRouter.pushAndRemoveUntil(
                                  context, LoginScreen());
                            },
                            child: Container(
                              decoration: const BoxDecoration(
                                // color: AppColors.white,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  bottomLeft: Radius.circular(10),
                                  topRight: Radius.circular(
                                      10), // Add top right radius
                                  bottomRight: Radius.circular(
                                      10), // Add bottom right radius
                                ),
                              ),
                              alignment: Alignment.center,
                              child: Text(
                                'Log in',
                                style: context.textTheme.bodySmall?.copyWith(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.black),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              NavRouter.pushAndRemoveUntil(
                                  context, const SignupScreen());
                              setState(() => isLoginSelected = false);
                            },
                            child: Container(
                              decoration: const BoxDecoration(
                                color: AppColors.black,
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(10),
                                  bottomRight: Radius.circular(10),
                                  topLeft: Radius.circular(
                                      10), // Add top left radius
                                  bottomLeft: Radius.circular(
                                      10), // Add bottom left radius
                                ),
                              ),
                              alignment: Alignment.center,
                              child: Text(
                                'Sign up',
                                style: context.textTheme.bodySmall?.copyWith(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.white),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  h2,
                  Image.asset(
                    Assets.pngSplashLogo1,
                    width: 100,
                    height: 100,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
