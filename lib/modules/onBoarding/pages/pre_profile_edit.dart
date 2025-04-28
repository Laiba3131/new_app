// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:kulture/ui/button/primary_button.dart';
// import 'package:kulture/utils/heights_and_widths.dart';
// import '../../../constants/app_colors.dart';
// import '../../../generated/assets.dart';
// import '../../dashboard/pages/dashboard_screen.dart';
// import 'pre_suggested_accounts.dart';
// import 'package:image_picker/image_picker.dart';
// import 'dart:io';

// class PreProfileEditPage extends StatefulWidget {
//   const PreProfileEditPage({super.key});

//   @override
//   State<PreProfileEditPage> createState() => _PreProfileEditPageState();
// }

// class _PreProfileEditPageState extends State<PreProfileEditPage> {
//   final TextEditingController _nameController = TextEditingController();
//   final TextEditingController _usernameController = TextEditingController();
//   final TextEditingController _bioController = TextEditingController();
//   final TextEditingController _linkController = TextEditingController();
//   bool _isPrivateProfile = false;
//   File? _selectedImage;

//   @override
//   void dispose() {
//     _nameController.dispose();
//     _usernameController.dispose();
//     _bioController.dispose();
//     _linkController.dispose();
//     super.dispose();
//   }

//   Future<void> _pickImage() async {
//     try {
//       final ImagePicker picker = ImagePicker();
//       final XFile? image = await picker.pickImage(source: ImageSource.gallery);

//       if (image != null) {
//         setState(() {
//           _selectedImage = File(image.path);
//         });
//       }
//     } catch (e) {
//       debugPrint('Error picking image: $e');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0,
//         automaticallyImplyLeading: false,
//         systemOverlayStyle: const SystemUiOverlayStyle(
//           statusBarColor: Colors.white,
//           statusBarIconBrightness: Brightness.dark,
//         ),
//         title: Row(
//           children: [
//             GestureDetector(
//               onTap: () => Navigator.pop(context),
//               child: Row(
//                 children: [
//                   Image.asset(Assets.backIcon, height: 24),
//                   w0P5,
//                   const Text(
//                     'Back',
//                     style: TextStyle(
//                       color: Colors.black,
//                       fontSize: 14,
//                       fontWeight: FontWeight.w500,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             const Spacer(),
//             GestureDetector(
//               onTap: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => const SuggestedCreatorScreen(),
//                   ),
//                 );
//               },
//               child: Row(
//                 children: [
//                   const Text(
//                     'Skip',
//                     style: TextStyle(
//                       color: Colors.black,
//                       fontSize: 14,
//                       fontWeight: FontWeight.w500,
//                     ),
//                   ),
//                   w0P5,
//                   Image.asset(Assets.skipIcon, height: 16),
//                 ],
//               ),
//             ),
//           ],
//         ),
//         centerTitle: false,
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const Center(
//                 child: Text(
//                   'Profile',
//                   style: TextStyle(
//                     fontSize: 24,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.black,
//                   ),
//                 ),
//               ),
//               const Center(
//                 child: Text(
//                   'Customize your profile.',
//                   style: TextStyle(
//                     fontSize: 14,
//                     color: Color(0xFF9E9E9E),
//                   ),
//                 ),
//               ),
//               h2,

//               // Container wrapping all sections
//               Container(
//                 margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
//                 decoration: BoxDecoration(
//                   // color: const Color(0xFFF5F5F5),
//                   borderRadius: BorderRadius.circular(23),
//                   border: Border.all(
//                     color: const Color(0xFFD4D4D4),
//                     width: 1,
//                   ),
//                 ),
//                 padding: const EdgeInsets.all(20),
//                 child: Column(
//                   children: [
//                     // Name section
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         const Text(
//                           'Name',
//                           style: TextStyle(
//                             fontSize: 16,
//                             fontWeight: FontWeight.w500,
//                           ),
//                         ),
//                         h0P8,
//                         Row(
//                           children: [
//                             Container(
//                               width: 20,
//                               height: 20,
//                               // decoration: BoxDecoration(
//                               //   color: const Color(0xFFF5F5F5),
//                               //   shape: BoxShape.circle,
//                               // ),
//                               child: Center(
//                                 child: Image.asset(
//                                   Assets.encryptIcon,
//                                   height: 24,
//                                   width: 24,
//                                 ),
//                               ),
//                             ),
//                             w1,
//                             Expanded(
//                               child: TextField(
//                                 controller: _nameController,
//                                 decoration: const InputDecoration(
//                                   hintText: '@usernamehere',
//                                   hintStyle: TextStyle(
//                                     color: Color.fromARGB(238, 0, 0, 0),
//                                     fontSize: 14,
//                                   ),
//                                   border: InputBorder.none,
//                                   contentPadding: EdgeInsets.zero,
//                                   isDense: true,
//                                   filled: true,
//                                   fillColor: Colors.white,
//                                 ),
//                                 onChanged: (value) {
//                                   if (value.isNotEmpty &&
//                                       !value.startsWith('@')) {
//                                     _nameController.text = '@' + value;
//                                     _nameController.selection =
//                                         TextSelection.fromPosition(
//                                       TextPosition(
//                                           offset: _nameController.text.length),
//                                     );
//                                   }
//                                 },
//                               ),
//                             ),
//                             GestureDetector(
//                               onTap: _pickImage,
//                               child: Container(
//                                 height: 40,
//                                 width: 40,
//                                 decoration: BoxDecoration(
//                                   shape: BoxShape.circle,
//                                   image: _selectedImage != null
//                                       ? DecorationImage(
//                                           image: FileImage(_selectedImage!),
//                                           fit: BoxFit.cover,
//                                         )
//                                       : null,
//                                 ),
//                                 child: _selectedImage == null
//                                     ? Image.asset(Assets.addUserIcon,
//                                         height: 40, width: 40)
//                                     : null,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),

//                     const Divider(height: 24, thickness: 1),

//                     // Bio section
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         const Text(
//                           'Bio',
//                           style: TextStyle(
//                             fontSize: 16,
//                             fontWeight: FontWeight.w500,
//                           ),
//                         ),
//                         h0P8,
//                         Row(
//                           crossAxisAlignment: CrossAxisAlignment.center,
//                           children: [
//                             Image.asset(Assets.addIcon, height: 20, width: 20),
//                             w0P5,
//                             Expanded(
//                               child: TextField(
//                                 controller: _bioController,
//                                 decoration: const InputDecoration(
//                                   hintText: 'Write your bio...',
//                                   hintStyle: TextStyle(
//                                     color: Colors.grey,
//                                     fontSize: 14,
//                                   ),
//                                   border: InputBorder.none,
//                                   contentPadding: EdgeInsets.zero,
//                                   filled: true,
//                                   fillColor: Colors.white,
//                                 ),
//                                 style: const TextStyle(height: 1.5),
//                                 minLines: 1,
//                                 maxLines: 3,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),

//                     const Divider(height: 32),

//                     // Link section
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         const Text(
//                           'Link',
//                           style: TextStyle(
//                             fontSize: 16,
//                             fontWeight: FontWeight.w500,
//                           ),
//                         ),
//                         h0P8,
//                         Row(
//                           children: [
//                             Image.asset(Assets.addIcon, height: 20, width: 20),
//                             w1,
//                             Expanded(
//                               child: TextField(
//                                   controller: _linkController,
//                                   keyboardType: TextInputType.url,
//                                   decoration: const InputDecoration(
//                                     hintText: 'Add a link here...',
//                                     hintStyle: TextStyle(
//                                       color: Colors.grey,
//                                       fontSize: 14,
//                                     ),
//                                     border: InputBorder.none,
//                                     contentPadding: EdgeInsets.zero,
//                                     filled: true,
//                                     fillColor: Colors.white,
//                                   ),
//                                   style: const TextStyle(
//                                     height: 1.5,
//                                     color: Color(0xFF1AA5C8),
//                                     fontSize: 14,
//                                   ),
//                                   onChanged: (value) {
//                                     if (value.isNotEmpty &&
//                                         !value.startsWith('http')) {
//                                       final fullUrl = 'https://$value';
//                                       final uri = Uri.tryParse(fullUrl);
//                                       final domain = uri?.host ?? value;

//                                       _linkController.text = domain;
//                                       _linkController.selection =
//                                           TextSelection.fromPosition(
//                                         TextPosition(
//                                             offset:
//                                                 _linkController.text.length),
//                                       );
//                                     }
//                                   }),
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),

//                     const Divider(height: 32),

//                     // Private profile section
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             const Text(
//                               'Private profile',
//                               style: TextStyle(
//                                 fontSize: 16,
//                                 fontWeight: FontWeight.w500,
//                               ),
//                             ),
//                             Switch(
//                               value: _isPrivateProfile,
//                               onChanged: (value) {
//                                 setState(() {
//                                   _isPrivateProfile = value;
//                                 });
//                               },
//                               activeColor: Colors.white,
//                               activeTrackColor: Colors.black,
//                               inactiveThumbColor: Colors.white,
//                               inactiveTrackColor: const Color(0xFFE0E0E0),
//                               materialTapTargetSize:
//                                   MaterialTapTargetSize.shrinkWrap,
//                             ),
//                           ],
//                         ),
//                         _isPrivateProfile
//                             ? const Text(
//                                 'Only your approved friends can \nsee and interact with your \ncontent. ',
//                                 style: TextStyle(
//                                   fontSize: 14,
//                                   color: Color(0xFF9E9E9E),
//                                 ),
//                               )
//                             : const Text(
//                                 'Anyone on Kultureapp can see,\nshare, and interact with your\ncontent.',
//                                 style: TextStyle(
//                                   fontSize: 14,
//                                   color: Color(0xFF9E9E9E),
//                                 ),
//                               )
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//               h1,
//               PrimaryButton(
//                   height: 45,
//                   vMargin: 0,
//                   hMargin: 0,
//                   onPressed: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => const SuggestedCreatorScreen(),
//                       ),
//                     );
//                   },
//                   title: 'Save',
//                   backgroundColor: AppColors.primaryColor,
//                   titleColor: AppColors.white,
//                   borderRadius: 25,
//                   shadowColor: AppColors.transparent),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
