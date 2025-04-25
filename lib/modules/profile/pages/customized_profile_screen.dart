import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kulture/config/config.dart';
import 'package:kulture/constants/app_colors.dart';
import 'package:kulture/modules/dashboard/pages/dashboard_persistent_bottom_bar.dart';
import 'package:kulture/modules/profile/pages/bio_page.dart';
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
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _bioController = TextEditingController();
  final TextEditingController _linkController = TextEditingController();
  bool _isPrivateProfile = false;
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
      appBar: const CustomAppbar(
        title: 'Back',
        showBack: true,
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              h1,
              Text(
                "Customize Your Profile",
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      fontSize: 32,
                      fontWeight: FontWeight.w700,
                      color: AppColors.textblackColor,
                    ),
              ),
              h1,

              // Container wrapping all sections
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
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
                    CustomInputField(
                      fun: () {},
                      title: 'Name',
                      iconPath: Assets.addIcon,
                      hintText: 'Jade Smith',
                      controller: _bioController,
                      minLines: 1,
                      maxLines: 3,
                    ),

                    Row(
                      children: [
                        Expanded(
                          child: CustomInputField(
                            fun: () {},
                            title: 'Username',
                            iconPath: Assets.addIcon,
                            hintText: '@jadesmith',
                            controller: _bioController,
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
                            controller: _bioController,
                            minLines: 1,
                            maxLines: 3,
                          ),
                        ),
                      ],
                    ),

                    // Bio section
                    CustomInputField(
                      fun: () {
                        NavRouter.push(context, BioPage());
                      },
                      title: 'Bio',
                      iconPath: Assets.addIcon,
                      hintText: 'Add a link here (optional)',
                      controller: _bioController,
                      minLines: 1,
                      maxLines: 3,
                    ),

                    CustomInputField(
                      fun: () {},
                      title: 'Interests',
                      iconPath: Assets.addIcon,
                      hintText: 'Add your interest here',
                      controller: _bioController,
                      minLines: 1,
                      maxLines: 3,
                    ),

                    CustomInputField(
                      fun: () {},
                      title: 'Link',
                      hintText: 'Add a link here...',
                      controller: _linkController,
                      inputType: TextInputType.url,
                      iconPath: Assets.addIcon,
                      textColor: const Color.fromARGB(255, 43, 26, 200),
                      onChanged: (value) {
                        if (value.isNotEmpty && !value.startsWith('http')) {
                          final fullUrl = 'https://$value';
                          final uri = Uri.tryParse(fullUrl);
                          final domain = uri?.host ?? value;

                          _linkController.text = domain;
                          _linkController.selection =
                              TextSelection.fromPosition(
                            TextPosition(offset: _linkController.text.length),
                          );
                        }
                      },
                    ),

                    Row(
                      children: [
                        Expanded(
                          child: CustomInputField(
                            fun: () {},
                            title: 'Country',
                            iconPath: Assets.addIcon,
                            hintText: 'United States',
                            controller: _bioController,
                            minLines: 1,
                            maxLines: 3,
                          ),
                        ),
                        w1,
                        Expanded(
                          child: CustomInputField(
                            fun: () {},
                            title: 'English',
                            iconPath: Assets.addIcon,
                            hintText: 'United States',
                            controller: _bioController,
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
                            controller: _bioController,
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
                            controller: _bioController,
                            minLines: 1,
                            maxLines: 3,
                          ),
                        ),
                      ],
                    ),
                    h5,
                    CustomSwitchTile(
                      title: 'Private info',
                      value: _isPrivateProfile,
                      onChanged: (value) {
                        setState(() {
                          _isPrivateProfile = value;
                        });
                      },
                      descriptionOn: 'Hide phone number & DOB',
                      descriptionOff: 'Hide phone number & DOB',
                    ),

                    h1,
                    Divider(),
                    h1,
                    CustomSwitchTile(
                      title: 'Private profile',
                      value: _isPrivateProfile,
                      onChanged: (value) {
                        setState(() {
                          _isPrivateProfile = value;
                        });
                      },
                      descriptionOn: 'Your content is public.',
                      descriptionOff: 'Your content is public.',
                    ),
                  ],
                ),
              ),
              h1,
              PrimaryButton(
                onPressed: () {},
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
    );
  }
}
