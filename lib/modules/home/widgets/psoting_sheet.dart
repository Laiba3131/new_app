import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kulture/constants/constants.dart';
import 'package:kulture/generated/assets.dart';
import 'package:kulture/ui/bottom_bar_visibility_provider.dart';
import 'package:kulture/ui/button/primary_button.dart';
import 'package:kulture/utils/heights_and_widths.dart';

class PostingSheet extends StatefulWidget {
  final Widget h2;

  const PostingSheet({Key? key, required this.h2}) : super(key: key);

  @override
  State<PostingSheet> createState() => _PostingSheetState();

  static void show(BuildContext context, {required Widget h2}) async {
    BottomBarVisibilityProvider().hide();

    await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext bc) {
        return PostingSheet(h2: h2);
      },
    );

    BottomBarVisibilityProvider().show();
  }
}

class _PostingSheetState extends State<PostingSheet> {
  File? _selectedMedia;
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickMedia() async {
    final XFile? media = await _picker.pickImage(source: ImageSource.gallery);
    if (media != null) {
      setState(() {
        _selectedMedia = File(media.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: MediaQuery.of(context).size.height * 0.6,
        child: Column(
          children: [
            // Top Bar
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 12, bottom: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Text('Cancel',
                        style: TextStyle(
                            fontSize: 17,
                            color: Colors.black,
                            fontWeight: FontWeight.w400)),
                  ),
                  const Text('New Content',
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 17)),
                  PrimaryButton(
                    title: 'Post',
                    backgroundColor: AppColors.primaryColor,
                    titleColor: AppColors.white,
                    borderRadius: 22,
                    height: 25,
                    width: 65,
                    vMargin: 0,
                    shadowColor: AppColors.transparent,
                    hMargin: 0,
                    onPressed: () {
                      Navigator.pop(context,true);
                    },
                  ),
                ],
              ),
            ),
            h0P6,
            const Divider(
              color: AppColors.lightGreyColor,
            ),
            h2,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 20,
                    backgroundImage: AssetImage(Assets.pngImage1),
                  ),
                  const SizedBox(width: 8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('lucylucy',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      Text('What would you like to say?',
                          style: TextStyle(color: Colors.grey)),
                      h1,
                      Row(
                        children: [
                          InkWell(
                            onTap: _pickMedia,
                            child: SvgPicture.asset(
                              Assets.gallery,
                              height: 20,
                            ),
                          ),
                          w2,
                          InkWell(
                            onTap: _pickMedia,
                            child: SvgPicture.asset(
                              Assets.camers,
                              height: 20,
                            ),
                          ),
                        ],
                      ),
                      h2,
                      if (_selectedMedia != null)
                        Stack(
                          children: [
                            Container(
                              width: 150,
                              height: 150,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                  image: FileImage(_selectedMedia!),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Positioned(
                              top: 5,
                              right: 5,
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _selectedMedia = null;
                                  });
                                },
                                child: const CircleAvatar(
                                  radius: 12,
                                  backgroundColor: Colors.black54,
                                  child: Icon(Icons.close,
                                      size: 16, color: Colors.white),
                                ),
                              ),
                            ),
                          ],
                        ),
                      widget.h2,
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
