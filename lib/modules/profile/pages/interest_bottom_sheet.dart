import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kulture/constants/constants.dart';
import 'package:kulture/generated/assets.dart';
import 'package:kulture/utils/heights_and_widths.dart';

class InterestsBottomSheet extends StatefulWidget {
  const InterestsBottomSheet({super.key});

  @override
  State<InterestsBottomSheet> createState() => _InterestsBottomSheetState();
}

class _InterestsBottomSheetState extends State<InterestsBottomSheet> {
  final Map<String, String> interests = {
    'Food and Cooking': Assets.burder,
    'Music': Assets.lips,
    'Travel': Assets.books,
    'Fashion & Style': Assets.emoji,
    'Health & Fitness': Assets.aroplane,
    'Beauty & Skincare': Assets.dress,
    'Tech & Gadgets': Assets.lips,
    'Education & Study Tips': Assets.books,
    'Comedy': Assets.books,
    'Gaming': Assets.dress,
    'Business & Entrepreneurship': Assets.lips,
    'Finance & Investing': Assets.books,
    'Pet Lovers': Assets.dress,
    'ASMR': Assets.dress,
    'Art & Design': Assets.books,
    'Memes & Trends': Assets.emoji,
    'Anime & Manga': Assets.dress,
    'Books & Reading': Assets.books,
    'Black Culture': Assets.lips,
    'Parenting': Assets.aroplane,
    'Side Hustles': Assets.burder,
    'Real Estate': Assets.books,
    'Motivation & Self-Improvement': Assets.books,
    'Car': Assets.lips,
    // 'App': Assets.svgApp,
    // 'Home care': Assets.svgHomeCare,
    // 'Family': Assets.svgFamily,
    // 'Marketing & Branding': Assets.svgMarketing,
    // 'Coding & App Development': Assets.svgCoding,
  };

  final Set<String> selectedInterests = {};

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.8,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: Column(
          children: [
            // Top Row
            Row(
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
                Visibility(
                  visible: selectedInterests.length < 3,
                  child: const Text(
                    'Pick 3+',
                    style: TextStyle(
                      color: AppColors.red,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context, selectedInterests.toList());
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
            h2,

            Expanded(
              child: SingleChildScrollView(
                child: Wrap(
                  spacing: 8,
                  runSpacing: 10,
                  children: interests.entries.map((entry) {
                    final String interest = entry.key;
                    final String iconPath = entry.value;
                    final bool isSelected =
                        selectedInterests.contains(interest);

                    return ChoiceChip(
                      selected: isSelected,
                      side: BorderSide(
                        color: isSelected
                            ? AppColors.primaryColor
                            : AppColors.searchBarColor,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      selectedColor: AppColors.primaryColor,
                      backgroundColor: Colors.white,
                      showCheckmark: false,
                      label: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset(
                            iconPath,
                            height: 16,
                            width: 16,
                            
                          ),
                          const SizedBox(width: 5),
                          Text(
                            interest,
                            style:
                                Theme.of(context).textTheme.bodySmall?.copyWith(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      color: isSelected
                                          ? Colors.white
                                          : AppColors.black,
                                    ),
                          ),
                        ],
                      ),
                      onSelected: (selected) {
                        setState(() {
                          if (selected) {
                            selectedInterests.add(interest);
                          } else {
                            selectedInterests.remove(interest);
                          }
                        });
                      },
                    );
                  }).toList(),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
