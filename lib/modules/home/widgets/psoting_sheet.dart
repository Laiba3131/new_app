import 'package:flutter/material.dart';
import 'package:kulture/generated/assets.dart';
import 'package:kulture/utils/heights_and_widths.dart';
import 'package:kulture/ui/widgets/bottom_sheet_utils.dart';
import 'package:kulture/ui/bottom_bar_visibility_provider.dart';

class PsotingSheet extends StatelessWidget {
  final Widget h2;

  const PsotingSheet({
    Key? key,
    required this.h2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Add to your post',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
              IconButton(
                icon: const Icon(Icons.close),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
          const Divider(),
          h1,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(
                children: [
                  CircleAvatar(
                    radius: 15,
                    backgroundImage: AssetImage(Assets.pngImage1),
                  ),
                  SizedBox(width: 8),
                  Text('lucylucy',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
              const SizedBox(height: 8),
              const Text('What would you like to say?',
                  style: TextStyle(color: Colors.grey)),
              const SizedBox(height: 16),
              Row(
                children: const [
                  Icon(Icons.image_outlined, color: Colors.grey, size: 30),
                  SizedBox(width: 16),
                  Icon(Icons.camera_alt_outlined, color: Colors.grey, size: 30),
                ],
              ),
              const SizedBox(height: 16),
              Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: const DecorationImage(
                    image: NetworkImage(
                        'https://via.placeholder.com/150'), // Replace with selected image
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              h2,
            ],
          ),
        ],
      ),
    );
  }

  static void show(BuildContext context,
      {required Widget h1, required Widget h2}) async {
    // Hide the bottom bar before showing the sheet
    BottomBarVisibilityProvider().hide();

    // Show the bottom sheet and await its closure
    await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext bc) {
        return PsotingSheet(h2: h2);
      },
    );

    // Show the bottom bar again after the sheet is closed
    BottomBarVisibilityProvider().show();
  }
}
