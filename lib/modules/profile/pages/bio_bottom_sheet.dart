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
  bool isButtonEnabled = false;
  @override
  void initState() {
    super.initState();
    _bioController.addListener(_handleTextChange);
  }

  void _handleTextChange() {
    final text = _bioController.text.trim();
    setState(() {
      isButtonEnabled = text.isNotEmpty;
    });
  }

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
                child: Text(
                  'Done',
                  style: TextStyle(
                    color:
                        isButtonEnabled ? Colors.black : AppColors.disableColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
          h3,
          Container(
            // height: 130,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: AppColors.searchBarColor),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Bio',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                    GestureDetector(
                      onTap: () => _bioController.clear(),
                      child: Container(
                        height: 24,
                        width: 24,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.searchBarColor,
                        ),
                        child: const Icon(
                          Icons.close,
                          size: 16,
                          color: AppColors.black,
                        ),
                      ),
                    ),
                  ],
                ),
                InputField(
                  controller: _bioController,
                  label: '',
                  borderColor: AppColors.transparent,
                  maxLines: 3,
                  borderRadius: 20,
                  labelColor: AppColors.transparent,
                  boxConstraints: 0,
                )
              ],
            ),
          ),
          h2,
        ],
      ),
    );
  }
}
