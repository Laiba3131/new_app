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
    'Food and Cooking': Assets.svgFvt,
    'Music': Assets.svgFvt,
    'Travel': Assets.svgFvt,
    'Fashion & Style': Assets.svgFvt,
    'Health & Fitness': Assets.svgFvt,
    'Beauty & Skincare': Assets.svgFvt,
    'Tech & Gadgets': Assets.svgFvt,
    'Education & Study Tips': Assets.svgFvt,
    'Comedy': Assets.svgFvt,
    'Gaming': Assets.svgFvt,
    'Business & Entrepreneurship': Assets.svgFvt,
    'Finance & Investing': Assets.svgFvt,
    'Pet Lovers': Assets.svgFvt,
    'ASMR': Assets.svgFvt,
    'Art & Design': Assets.svgFvt,
    'Memes & Trends': Assets.svgFvt,
    'Anime & Manga': Assets.svgFvt,
    'Books & Reading': Assets.svgFvt,
    'Black Culture': Assets.svgFvt,
    'Parenting': Assets.svgFvt,
    'Side Hustles': Assets.svgFvt,
    'Real Estate': Assets.svgFvt,
    'Motivation & Self-Improvement': Assets.svgFvt,
    'Car': Assets.svgFvt,
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
                          SvgPicture.asset(
                            iconPath,
                            height: 16,
                            width: 16,
                            color: isSelected ? Colors.white : AppColors.black,
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
