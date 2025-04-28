import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kulture/config/config.dart';
import 'package:kulture/constants/app_colors.dart';
import 'package:kulture/modules/profile/pages/customized_profile_screen.dart';
import 'package:kulture/modules/questionnaire/widgets/custom_progress_bar.dart';
import 'package:kulture/ui/button/primary_button.dart';
import 'package:kulture/utils/heights_and_widths.dart';
import '../cubit/questionnaire_cubit.dart';

class GenderSelectionScreen extends StatefulWidget {
  const GenderSelectionScreen({super.key});

  @override
  State<GenderSelectionScreen> createState() => _GenderSelectionScreenState();
}

class _GenderSelectionScreenState extends State<GenderSelectionScreen> {
  String? selectedGender;
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        toolbarHeight: 60,
        title: const Column(
          children: [
            CustomProgressBar(
              segmentColors: [
                AppColors.primaryColor,
                AppColors.primaryColor,
              ],
              flexValues: [1, 1],
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Text(
                "Choose Your Gender",
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      fontSize: 32,
                      fontWeight: FontWeight.w700,
                      color: AppColors.textblackColor,
                    ),
              ),
              const SizedBox(height: 6),
              Text(
                "This helps us personalize content and recommendations to better suit your interests.",
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      fontSize: 17,
                      fontWeight: FontWeight.w400,
                      color: AppColors.searchBarTextColor,
                    ),
              ),
              const SizedBox(height: 24),
              _buildGenderOption("Male", "male", AppColors.primaryColor),
              const SizedBox(height: 12),
              _buildGenderOption("Female", "female", AppColors.pink),
              const SizedBox(height: 12),
              _buildGenderOption("Others", "others", AppColors.purple),
              const Spacer(),
              PrimaryButton(
                onPressed: _submitForm,
                title: 'Next',
                height: 60,
                backgroundColor: selectedGender == null
                    ? AppColors.greyColor
                    : AppColors.primaryColor,
                borderRadius: 50,
                width: double.infinity,
                shadowColor: AppColors.transparent,
                hMargin: 0,
                titleColor: AppColors.white,
              ),
              h1,
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildGenderOption(String label, String value, containerColor) {
    final isSelected = selectedGender == value;

    return InkWell(
      onTap: () {
        setState(() {
          selectedGender = value;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color:
                isSelected ? AppColors.primaryColor : AppColors.searchBarColor,
            width: 1,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: AppColors.searchBarTextColor,
                  ),
            ),
            // if (isSelected)
            Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: containerColor,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _submitForm() {
    if (selectedGender != null) {
      final cubit = context.read<QuestionnaireCubit>();
      cubit.updateGender(selectedGender!);
      cubit.submitGenderInfo();

      // ScaffoldMessenger.of(context).showSnackBar(
      //   const SnackBar(
      //     content: Text("Questionnaire completed successfully!"),
      //     backgroundColor: Colors.green,
      //   ),
      // );

      NavRouter.push(context, const CustomizedProfileScreen());
    } else {
      // ScaffoldMessenger.of(context).showSnackBar(
      //   const SnackBar(
      //     content: Text("Please select your gender"),
      //     backgroundColor: Colors.red,
      //   ),
      // );
    }
  }
}
