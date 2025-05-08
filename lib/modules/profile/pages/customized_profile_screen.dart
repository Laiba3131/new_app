import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kulture/config/config.dart';
import 'package:kulture/constants/app_colors.dart';
import 'package:kulture/modules/auth/pages/login_screen.dart';
import 'package:kulture/modules/onBoarding/pages/pre_suggested_accounts.dart';
import 'package:kulture/modules/profile/pages/bio_bottom_sheet.dart';
import 'package:kulture/modules/profile/pages/interest_bottom_sheet.dart';
import 'package:kulture/modules/profile/widgets/custom_input_field.dart';
import 'package:kulture/modules/profile/widgets/custom_switch_tile.dart';
import 'package:kulture/ui/button/primary_button.dart';
import 'package:kulture/ui/widgets/custom_appbar.dart';
import 'package:kulture/utils/heights_and_widths.dart';
import '../../../generated/assets.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class CustomizedProfileScreen extends StatefulWidget {
  const CustomizedProfileScreen({super.key});

  @override
  State<CustomizedProfileScreen> createState() =>
      _CustomizedProfileScreenState();
}

class _CustomizedProfileScreenState extends State<CustomizedProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _bioController = TextEditingController();
  final TextEditingController _linkController = TextEditingController();
  final TextEditingController _interestController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();
  final TextEditingController _countryController = TextEditingController();
  final TextEditingController _languageController = TextEditingController();
  final TextEditingController _genderController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  List<String>? selectedInterests = [];
  bool _isPrivateProfile = false;
  bool _isPrivatInfo = false;
  File? _selectedImage;

  @override
  void dispose() {
    _nameController.dispose();
    _usernameController.dispose();
    _bioController.dispose();
    _linkController.dispose();
    super.dispose();
  }

  Future<void> _pickImage() async {
    try {
      final ImagePicker picker = ImagePicker();
      final XFile? image = await picker.pickImage(source: ImageSource.gallery);

      if (image != null) {
        setState(() {
          _selectedImage = File(image.path);
        });
      }
    } catch (e) {
      debugPrint('Error picking image: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppbar(
        onBack: () => NavRouter.push(context, LoginScreen()),
        title: 'Back',
        showBack: true,
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                h1,
                Text(
                  "Customize Your Profile",
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontSize: 28,
                        fontWeight: FontWeight.w700,
                        color: AppColors.textblackColor,
                      ),
                ),
                h1,

                // Container wrapping all sections
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                  decoration: BoxDecoration(
                    // color: const Color(0xFFF5F5F5),
                    borderRadius: BorderRadius.circular(23),
                    border: Border.all(
                      color: const Color(0xFFD4D4D4),
                      width: 1,
                    ),
                  ),
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: CustomInputField(
                              fun: () {},
                              title: 'Name',
                              iconPath: Assets.addIcon,
                              hintText: 'Jade Smith',
                              controller: _nameController,
                              minLines: 1,
                              maxLines: 3,
                            ),
                          ),
                          w1,
                          GestureDetector(
                            onTap: _pickImage,
                            child: Container(
                              height: 47,
                              width: 47,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: _selectedImage != null
                                    ? DecorationImage(
                                        image: FileImage(_selectedImage!),
                                        fit: BoxFit.cover,
                                      )
                                    : null,
                              ),
                              child: _selectedImage == null
                                  ? Image.asset(Assets.addUserIcon,
                                      height: 40, width: 40)
                                  : null,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: CustomInputField(
                              fun: () {},
                              title: 'Username',
                              iconPath: Assets.addIcon,
                              hintText: '@jadesmith',
                              controller: _usernameController,
                              minLines: 1,
                              maxLines: 3,
                            ),
                          ),
                          w1,
                          Expanded(
                            child: CustomInputField(
                              fun: () {},
                              title: 'Date of Birth',
                              iconPath: Assets.addIcon,
                              hintText: '12/25/1998',
                              controller: _dobController,
                              minLines: 1,
                              maxLines: 3,
                            ),
                          ),
                        ],
                      ),
                      InkWell(
                        onTap: () async {
                          final result = await showModalBottomSheet<String>(
                            context: context,
                            isScrollControlled: true,
                            backgroundColor: Colors.white,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(20)),
                            ),
                            builder: (context) => BioBottomSheet(),
                          );

                          _bioController.text = result ?? '';
                        },
                        child: CustomInputField(
                          fun: () async {
                            final result = await showModalBottomSheet<String>(
                              context: context,
                              isScrollControlled: true,
                              backgroundColor: Colors.white,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(20)),
                              ),
                              builder: (context) => BioBottomSheet(),
                            );

                            _bioController.text = result ?? '';
                          },
                          title: 'Bio',
                          iconPath: Assets.addIcon,
                          hintText: 'Add a link here (optional)',
                          controller: _bioController,
                          minLines: 1,
                          maxLines: 3,
                          isReadOnly: true,
                        ),
                      ),
                      InkWell(
                        onTap: () async {
                          selectedInterests =
                              await showModalBottomSheet<List<String>>(
                            context: context,
                            isScrollControlled: true,
                            backgroundColor: Colors.transparent,
                            builder: (context) => const InterestsBottomSheet(),
                          );

                          if (selectedInterests != null) {
                            _interestController.text =
                                selectedInterests!.join(', ');
                          }
                        },
                        child: CustomInputField(
                          fun: () async {
                            selectedInterests =
                                await showModalBottomSheet<List<String>>(
                              context: context,
                              isScrollControlled: true,
                              backgroundColor: Colors.transparent,
                              builder: (context) =>
                                  const InterestsBottomSheet(),
                            );

                            if (selectedInterests != null) {
                              _interestController.text =
                                  selectedInterests!.join(', ');
                            }
                          },
                          title: 'Interests',
                          iconPath: Assets.addIcon,
                          hintText: 'Add your interest here',
                          controller: _interestController,
                          minLines: 1,
                          maxLines: 3,
                          isReadOnly: true,
                          validator: (_) {
                            if (selectedInterests!.length < 3) {
                              return 'Please choose your interests';
                            }
                            return null;
                          },
                        ),
                      ),
                      CustomInputField(
                          fun: () {},
                          title: 'Link',
                          hintText: 'Add a link here...',
                          controller: _linkController,
                          inputType: TextInputType.url,
                          iconPath: Assets.addIcon,
                          textColor: AppColors.primaryColor,
                          onChanged: (value) {
                            if (value.isNotEmpty) {
                              // Remove protocols and 'www.' prefix if they exist
                              String cleanedValue = value
                                  .replaceFirst(RegExp(r'^https?:\/\/'), '')
                                  .replaceFirst(RegExp(r'^www\.'), '');

                              final uri = Uri.tryParse('https://$cleanedValue');
                              final domain = uri?.host ?? cleanedValue;

                              // Prevent infinite loop caused by re-setting the text
                              if (domain != _linkController.text) {
                                _linkController.text = domain;
                                _linkController.selection =
                                    TextSelection.fromPosition(
                                  TextPosition(offset: domain.length),
                                );
                              }
                            }
                          }),
                      Row(
                        children: [
                          Expanded(
                            child: CustomInputField(
                              fun: () {},
                              title: 'Country',
                              iconPath: Assets.addIcon,
                              hintText: 'United States',
                              controller: _countryController,
                              minLines: 1,
                              maxLines: 3,
                            ),
                          ),
                          w1,
                          Expanded(
                            child: CustomInputField(
                              fun: () {},
                              title: 'Language',
                              iconPath: Assets.addIcon,
                              hintText: 'English',
                              controller: _languageController,
                              minLines: 1,
                              maxLines: 3,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: CustomInputField(
                              fun: () {},
                              title: 'Gender',
                              iconPath: Assets.addIcon,
                              hintText: 'Female',
                              controller: _genderController,
                              minLines: 1,
                              maxLines: 3,
                            ),
                          ),
                          w1,
                          Expanded(
                            child: CustomInputField(
                              fun: () {},
                              title: 'Phone number',
                              iconPath: Assets.addIcon,
                              hintText: 'Number',
                              controller: _phoneNumberController,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              minLines: 1,
                              keyboardType: TextInputType.number,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Enter a number';
                                }
                                // Add more validation logic if needed
                                return null;
                              },
                              maxLines: 3,
                            ),
                          ),
                        ],
                      ),
                      h5,
                      CustomSwitchTile(
                        title: 'Private info',
                        value: _isPrivatInfo,
                        onChanged: (value) {
                          setState(() {
                            _isPrivatInfo = value;
                          });
                        },
                        descriptionOn: 'Hide phone number & DOB',
                        descriptionOff: 'Hide phone number & DOB',
                      ),
                      h1,
                      const Divider(
                        color: AppColors.lightGreyColor,
                      ),
                      h1,
                      CustomSwitchTile(
                        title: 'Private profile',
                        value: _isPrivateProfile,
                        onChanged: (value) {
                          setState(() {
                            _isPrivateProfile = value;
                          });
                        },
                        descriptionOn: 'Your content is private.',
                        descriptionOff: 'Your content is public.',
                      ),
                    ],
                  ),
                ),
                h1,
                PrimaryButton(
                  onPressed: () {
                    if (_formKey.currentState?.validate() == true) {
                      NavRouter.push(context, const SuggestedCreatorScreen());
                    }
                  },
                  title: 'Next',
                  height: 60,
                  backgroundColor: AppColors.primaryColor,
                  borderRadius: 50,
                  width: double.infinity,
                  shadowColor: AppColors.transparent,
                  hMargin: 0,
                  titleColor: AppColors.white,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
