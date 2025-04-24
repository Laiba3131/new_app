import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kulture/modules/settings/widgets/custom_container.dart';
import 'package:kulture/modules/settings/widgets/custom_tile_widget.dart';
import 'package:kulture/ui/widgets/custom_appbar.dart';

class AccountsScreen extends StatelessWidget {
  const AccountsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(
        title: 'Account',
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
                  title: 'Delete account',
                  onChanged: (value) {},
                  isSwitch: false,
                  fun: () {
                    //  NavRouter.push(
                    //     context,
                    //     const AccountsScreen(),
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
