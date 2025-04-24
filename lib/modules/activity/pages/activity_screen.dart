import 'package:flutter/material.dart';
import 'package:kulture/constants/app_colors.dart';
import 'package:kulture/modules/activity/widgets/all_tab.dart';
import 'package:kulture/utils/extensions/extended_context.dart';
import 'package:kulture/utils/heights_and_widths.dart';

class ActivityScreen extends StatefulWidget {
  const ActivityScreen({super.key});

  @override
  State<ActivityScreen> createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivityScreen> {
  final List<String> tabs = ['All', 'Follows', 'Replies', '@'];
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      bottom: false,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Activity',
              style: context.textTheme.bodyMedium?.copyWith(
                  color: AppColors.black,
                  fontSize: 32,
                  fontWeight: FontWeight.w700),
            ),
            h1,
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(tabs.length, (index) {
                  final bool isSelected = selectedIndex == index;
                  return Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: GestureDetector(
                      onTap: () => setState(() => selectedIndex = index),
                      child: Container(
                        width: 90,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        decoration: BoxDecoration(
                          color: isSelected ? AppColors.primaryColor : Colors.white,
                          border: Border.all(color:isSelected?AppColors.primaryColor: Colors.black),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Center(
                          child: Text(
                            tabs[index],
                            style: TextStyle(
                              color: isSelected ? Colors.white : Colors.black,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),
            h2,
            Expanded(child: _getTabContent()),
          ],
        ),
      ),
    ));
  }

  Widget _getTabContent() {
    switch (selectedIndex) {
      case 0:
        return const AllTab(showOnlyFollows: false);
      case 1:
        return const AllTab(showOnlyFollows: true);
      case 2:
        return Center(
            child: Text(
          "Nothing to see here yet",
          style: context.textTheme.bodyMedium?.copyWith(
              color: AppColors.textGrey,
              fontSize: 14,
              fontWeight: FontWeight.w700),
        ));
      case 3:
        return Center(
            child: Text(
          "Nothing to see here yet",
          style: context.textTheme.bodyMedium?.copyWith(
              color: AppColors.textGrey,
              fontSize: 14,
              fontWeight: FontWeight.w700),
        ));
      default:
        return const SizedBox();
    }
  }
}
