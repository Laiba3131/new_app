import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kulture/modules/settings/widgets/custom_container.dart';
import 'package:kulture/modules/settings/widgets/custom_tile_widget.dart';
import 'package:kulture/ui/widgets/custom_appbar.dart';

class AboutAppScreen extends StatelessWidget {
  const AboutAppScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(
        title: 'About Kultureapp',
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
                  title: 'Privacy Policy',
                  onChanged: (value) {},
                  isSwitch: false,
                  fun: () {},
                ),
                CustomTileWidget(
                  title: 'Terms of Service',
                  onChanged: (value) {},
                  isSwitch: false,
                  fun: () {},
                ),
                CustomTileWidget(
                  title: 'Community Guideline',
                  onChanged: (value) {},
                  isSwitch: false,
                  fun: () {},
                ),
                CustomTileWidget(
                  isBorder: false,
                  title: 'Intellectual Property Policy',
                  onChanged: (value) {},
                  isSwitch: false,
                  fun: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
