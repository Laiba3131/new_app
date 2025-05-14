import 'package:flutter/material.dart';
import 'package:kulture/config/config.dart';
import 'package:kulture/constants/app_colors.dart';
import 'package:kulture/generated/assets.dart';
import 'package:kulture/ui/input/input_field.dart';
import 'package:kulture/utils/extensions/extended_context.dart';

class SearchNoteScreen extends StatefulWidget {
  const SearchNoteScreen({super.key});

  @override
  State<SearchNoteScreen> createState() => _SearchNoteScreenState();
}

class _SearchNoteScreenState extends State<SearchNoteScreen> {
  TextEditingController searchController = TextEditingController();

  final List<Map<String, String>> users = [
    {'name': 'Queen Bee', 'username': 'queenofthebees', 'image': Assets.img1},
    {
      'name': 'Ashley Backer',
      'username': 'ashleythename',
      'image': Assets.img2
    },
    {'name': 'Bee Queen', 'username': 'officialqueenbee', 'image': Assets.img3},
    {'name': 'Cindy Pat', 'username': 'cindysandy', 'image': Assets.img4},
  ];

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> repeatedUsers =
        List.generate(3, (_) => users).expand((userList) => userList).toList();

    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: (){
            NavRouter.pop(context);
          },
          child: const Icon(Icons.arrow_back_ios_new_sharp)),
        title: Text(
          'Send a new note',
          style: context.textTheme.bodyMedium?.copyWith(
              color: AppColors.black,
              fontSize: 17,
              fontWeight: FontWeight.w600),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
            child: InputField(
              controller: searchController,
              label: 'To:Search',
              borderRadius: 17,
              borderColor: AppColors.searchBarColor,
              focusBorderColor:AppColors.searchBarColor,
              boxConstraints: 20,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Suggested accounts',
                style: context.textTheme.bodyMedium?.copyWith(
                    color: AppColors.black,
                    fontSize: 17,
                    fontWeight: FontWeight.w600),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: repeatedUsers.length,
              itemBuilder: (context, index) {
                final user = repeatedUsers[index];
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: AssetImage(user['image']!),
                  ),
                  title: Text(
                    user['name']!,
                    style: context.textTheme.bodyMedium?.copyWith(
                        color: AppColors.black,
                        fontSize: 17,
                        fontWeight: FontWeight.w400),
                  ),
                  subtitle: Text(
                    user['username']!,
                    style: context.textTheme.bodyMedium?.copyWith(
                        color: AppColors.svgIconColor,
                        fontSize: 17,
                        fontWeight: FontWeight.w400),
                  ),
                  onTap: () {},
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
