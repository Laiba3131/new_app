import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kulture/constants/constants.dart';
import 'package:kulture/ui/input/input_field.dart';
import 'package:kulture/utils/heights_and_widths.dart';

class BioBottomSheet extends StatefulWidget {
  const BioBottomSheet({super.key});

  @override
  State<BioBottomSheet> createState() => _BioBottomSheetState();
}

class _BioBottomSheetState extends State<BioBottomSheet> {
  final TextEditingController _bioController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.6,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      child: Wrap(
        children: [
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
                  Navigator.pop(context, _bioController.text.trim());
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
          h3,
          InputField(
            controller: _bioController,
            label: 'Bio',
            borderColor: AppColors.searchBarColor,
            maxLines: 5,
            borderRadius: 20,
            boxConstraints: 10,
            suffixIcon: GestureDetector(
              onTap: () => _bioController.clear(),
              child: Container(
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
                ),
              ),
            ),
          ),
          h2,
        ],
      ),
    );
  }
}
