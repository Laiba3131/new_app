import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kulture/modules/auth/pages/login_options.dart';
import 'package:kulture/modules/start_up/cubit/splash_cubit.dart';
import 'package:kulture/modules/start_up/cubit/splash_state.dart';
import 'package:kulture/utils/heights_and_widths.dart';
import '../../../config/routes/nav_router.dart';
import '../../../constants/app_colors.dart';
import '../../../generated/assets.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => StartupCubit()..init(),
      child: Scaffold(
        backgroundColor: AppColors.white,
        body: BlocConsumer<StartupCubit, StartupState>(
          listener: (context, state) {
            if (state.status == Status.success) {
              NavRouter.pushAndRemoveUntil(context, const LoginOptions());
            }
          },
          builder: (context, state) {
            return Stack(
              children: [
                Center(
                  child: Image.asset(
                    Assets.pngSplashLogo,
                    width: 200,
                    height: 200,
                  ),
                ),
                Positioned(
                  bottom: 10,
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
              ],
            );
          },
        ),
      ),
    );
  }
}
