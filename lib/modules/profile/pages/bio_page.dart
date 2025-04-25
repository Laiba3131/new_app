import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kulture/constants/constants.dart';
import 'package:kulture/ui/input/input_field.dart';

class BioPage extends StatelessWidget {
  const BioPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarIconBrightness: Brightness.dark,
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () => Navigator.pop(context),
              child: const Text(
                'Cancel',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const Text(
              'Edit bio',
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            GestureDetector(
              onTap: () {
                // NavRouter.push(context, const DashboardPersistentBottomBar());
              },
              child: const Text(
                'Done',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
        centerTitle: false,
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: InputField(
          controller: TextEditingController(),
          label: 'Bio',
          borderColor: AppColors.searchBarColor,
          maxLines: 5,
          borderRadius: 20,
          boxConstraints: 10,
          suffixIcon: Container(
              height: 20,
              width: 20,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: AppColors.searchBarColor,
              ),
              child: const Icon(
                Icons.close,
                color: AppColors.black,
                size: 20,
              )),
        ),
      ),
    );
  }
}
