import 'package:flutter/material.dart';
import 'package:kulture/constants/app_colors.dart';
import 'package:kulture/ui/button/primary_button.dart';
import 'package:kulture/utils/extensions/extended_context.dart';
import 'package:kulture/utils/heights_and_widths.dart';
import 'package:kulture/ui/bottom_bar_visibility_provider.dart';

void showReportBottomSheet(BuildContext context) async {
  // Hide the bottom bar before showing the sheet
  BottomBarVisibilityProvider().hide();

  // Show the bottom sheet and await its closure
  await showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (_) {
      return const ReportBottomSheet();
    },
  );

  // Show the bottom bar again after the sheet is closed
  BottomBarVisibilityProvider().show();
}

class ReportBottomSheet extends StatelessWidget {
  const ReportBottomSheet({super.key});

  final List<String> reasons = const [
    "I just don't like it",
    "Dangerous person/organization",
    "Illegal activities or restricted items",
    "Minor safety",
    "Violent or graphic content",
    "Suicide, self-harm, and dangerous behavior",
    "Hate speech",
    "Nudity or sexual content",
    "Fraudulent activities",
    "Misleading information",
    "Others"
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: Container(
        height: MediaQuery.of(context).size.height * 0.7,
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: 4,
                width: 40,
                margin: const EdgeInsets.only(bottom: 20),
                decoration: BoxDecoration(
                  color: Colors.grey[400],
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              Text(
                'Report',
                style: context.textTheme.bodyMedium?.copyWith(
                  color: AppColors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                'Want to report this post?',
                style: context.textTheme.bodyMedium?.copyWith(
                  color: AppColors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  'Your report stays anonymous, but if someone is in urgent danger, reach out to emergency services immediately—every second counts.',
                  textAlign: TextAlign.center,
                  style: context.textTheme.bodyMedium?.copyWith(
                    color: AppColors.textGrey,
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              ...reasons.map((reason) => Column(
                    children: [
                      ListTile(
                        contentPadding: EdgeInsets.zero,
                        title: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12.0),
                          child: Text(
                            reason,
                            style: context.textTheme.bodyMedium?.copyWith(
                              color: AppColors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ),
                        onTap: () {
                          Navigator.pop(context);
                        },
                      ),
                      const Divider(
                        height: 1,
                        color: AppColors.lightGreyColor,
                      ),
                    ],
                  )),
              h1,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: PrimaryButton(
                    height: 45,
                    vMargin: 0,
                    hMargin: 0,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    title: 'Report',
                    backgroundColor: AppColors.red,
                    titleColor: AppColors.white,
                    borderRadius: 15,
                    shadowColor: AppColors.transparent),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
