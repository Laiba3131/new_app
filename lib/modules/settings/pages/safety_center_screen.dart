import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kulture/modules/settings/widgets/custom_container.dart';
import 'package:kulture/modules/settings/widgets/custom_tile_widget.dart';
import 'package:kulture/ui/widgets/custom_appbar.dart';

class SafetyCenterScreen extends StatelessWidget {
  const SafetyCenterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(
        title: 'Safety center',
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
                  title:
                      'Learn about Tenn safety, Reporting, Privacy and Security',
                  onChanged: (value) {},
                  isSwitch: false,
                  fun: () {
                    //  NavRouter.push(
                    //     context,
                    //     const SafetyCenterScreen(),
                    //   );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
