import 'package:flutter/material.dart';
import 'package:kulture/constants/app_colors.dart';
import 'package:kulture/ui/input/input_field.dart';

class SearchNoteScreen extends StatefulWidget {

  const SearchNoteScreen({super.key});

  @override
  State<SearchNoteScreen> createState() => _SearchNoteScreenState();
}

class _SearchNoteScreenState extends State<SearchNoteScreen> {
  TextEditingController searchController=TextEditingController();

  final List<Map<String, String>> users = [
    {
      'name': 'Queen Bee',
      'username': 'queenofthebees',
      'image': 'https://via.placeholder.com/150'
    },
    {
      'name': 'Ashley Backer',
      'username': 'ashleythename',
      'image': 'https://via.placeholder.com/150'
    },
    {
      'name': 'Bee Queen',
      'username': 'officialqueenbee',
      'image': 'https://via.placeholder.com/150'
    },
    {
      'name': 'Cindy Pat',
      'username': 'cindysandy',
      'image': 'https://via.placeholder.com/150'
    },
  ];

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> repeatedUsers = List.generate(
        3, (_) => users).expand((userList) => userList).toList();

    return Scaffold(
      appBar: AppBar(
        leading: BackButton(color: Colors.black),
        title: Text(
          'Send a new note',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        children: [
          // Search Field
          Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
          child: InputField(
            controller: searchController,
            label: 'Search...',
            borderRadius: 17,
            borderColor: AppColors.searchBarColor,
            // fillColor: AppColors.searchBarColor,
            prefixIcon: const Icon(
              Icons.search,
              color: AppColors.textGrey,
            ),
            boxConstraints: 50,
          ),
        ),
          // Suggested Accounts Title
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Suggested accounts',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
          ),
          // Suggested Accounts List
          Expanded(
            child: ListView.builder(
              itemCount: repeatedUsers.length,
              itemBuilder: (context, index) {
                final user = repeatedUsers[index];
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(user['image']!),
                  ),
                  title: Text(user['name']!),
                  subtitle: Text(
                    user['username']!,
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                  onTap: () {
                   
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
