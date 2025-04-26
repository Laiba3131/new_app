import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kulture/constants/app_colors.dart';
import 'package:kulture/modules/settings/widgets/custom_container.dart';
import 'package:kulture/modules/settings/widgets/custom_tile_widget.dart';
import 'package:kulture/ui/button/primary_button.dart';
import 'package:kulture/ui/widgets/custom_appbar.dart';
import 'package:kulture/utils/heights_and_widths.dart';

class WhoCanMessageMeScreen extends StatefulWidget {
  const WhoCanMessageMeScreen({super.key});

  @override
  State<WhoCanMessageMeScreen> createState() => _WhoCanMessageMeScreenState();
}

class _WhoCanMessageMeScreenState extends State<WhoCanMessageMeScreen> {
  String selectedOption = 'Everyone';

  void _onToggle(String option) {
    setState(() {
      selectedOption = option;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(
        title: 'Who can message me',
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
                  isBorder: false,
                  title: 'Everyone',
                  value: selectedOption == 'Everyone',
                  onChanged: (_) => _onToggle('Everyone'),
                ),
              ],
            ),
            h1,
            NotificationSection(
              children: [
                CustomTileWidget(
                  isBorder: false,
                  title: 'Friends',
                  value: selectedOption == 'Friends',
                  onChanged: (_) => _onToggle('Friends'),
                ),
              ],
            ),
            h1,
            NotificationSection(
              children: [
                CustomTileWidget(
                  isBorder: false,
                  title: 'No one',
                  value: selectedOption == 'No one',
                  onChanged: (_) => _onToggle('No one'),
                ),
              ],
            ),
            h3,
            PrimaryButton(
              height: 45,
              vMargin: 0,
              hMargin: 0,
              onPressed: () {
                // Do something with selectedOption
                print('Saved: $selectedOption');
              },
              title: 'Save changes',
              backgroundColor: AppColors.primaryColor,
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
