import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kulture/constants/app_colors.dart';
import 'package:kulture/modules/settings/widgets/custom_container.dart';
import 'package:kulture/modules/settings/widgets/custom_tile_widget.dart';
import 'package:kulture/ui/button/primary_button.dart';
import 'package:kulture/ui/widgets/custom_appbar.dart';
import 'package:kulture/utils/heights_and_widths.dart';

class EnableAuthScreen extends StatefulWidget {
  const EnableAuthScreen({super.key});

  @override
  State<EnableAuthScreen> createState() => _EnableAuthScreenState();
}

class _EnableAuthScreenState extends State<EnableAuthScreen> {
  bool isEnabled = true;

  void _onToggle(bool value) {
    setState(() {
      isEnabled = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(
        title: 'Enable 2 Steps Authentication',
        showBack: true,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            NotificationSection(
              children: [
                CustomTileWidget(
                  title: '2 step auth',
                  value: isEnabled,
                  onChanged: _onToggle,
                ),
              ],
            ),
            h3,
            PrimaryButton(
              height: 45,
              vMargin: 0,
              hMargin: 0,
              onPressed: () {},
              title: 'Save changes',
              backgroundColor: AppColors.black,
              titleColor: AppColors.white,
              borderRadius: 17,
              shadowColor: AppColors.transparent,
            ),
          ],
        ),
      ),
    );
  }
}
