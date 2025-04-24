// import 'package:flutter/material.dart';

// class SocialPostItem extends StatelessWidget {
//   final String username;
//   final String timeAgo;
//   final String content;
//   final List<String> hashtags;
//   final int likes;
//   final int comments;
//   final int shares;
//   final String userAvatarUrl;

//   const SocialPostItem({
//     Key? key,
//     required this.username,
//     required this.timeAgo,
//     required this.content,
//     required this.hashtags,
//     required this.likes,
//     required this.comments,
//     required this.shares,
//     required this.userAvatarUrl,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           // User avatar
//           CircleAvatar(
//             radius: 20,
//             backgroundImage: NetworkImage(userAvatarUrl),
//           ),
//           const SizedBox(width: 12),
//           // Post content area
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 // Username and timestamp
//                 Row(
//                   children: [
//                     Text(
//                       username,
//                       style: const TextStyle(
//                         fontSize: 16,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     const SizedBox(width: 6),
//                     Text(
//                       timeAgo,
//                       style: const TextStyle(
//                         color: Colors.grey,
//                         fontSize: 14,
//                       ),
//                     ),
//                     const Spacer(),
//                     const Icon(Icons.more_horiz, color: Colors.grey, size: 18),
//                   ],
//                 ),
//                 const SizedBox(height: 6),

//                 // Post text content
//                 Text(
//                   content,
//                   style: const TextStyle(fontSize: 15),
//                 ),

//                 const SizedBox(height: 6),

//                 // Hashtags
//                 Wrap(
//                   spacing: 4,
//                   children: hashtags
//                       .map((tag) => Text(
//                             '#$tag',
//                             style: const TextStyle(
//                               color: Colors.blue,
//                               fontSize: 14,
//                               fontWeight: FontWeight.w500,
//                             ),
//                           ))
//                       .toList(),
//                 ),

//                 const SizedBox(height: 12),

//                 // Interaction buttons
//                 Row(
//                   children: [
//                     // Likes
//                     Row(
//                       children: [
//                         const Icon(Icons.favorite_border,
//                             size: 18, color: Colors.grey),
//                         const SizedBox(width: 4),
//                         Text(
//                           likes.toString(),
//                           style: const TextStyle(
//                             color: Colors.grey,
//                             fontSize: 14,
//                           ),
//                         ),
//                       ],
//                     ),

//                     const SizedBox(width: 16),

//                     // Comments
//                     Row(
//                       children: [
//                         const Icon(Icons.chat_bubble_outline,
//                             size: 18, color: Colors.grey),
//                         const SizedBox(width: 4),
//                         Text(
//                           comments.toString(),
//                           style: const TextStyle(
//                             color: Colors.grey,
//                             fontSize: 14,
//                           ),
//                         ),
//                       ],
//                     ),

//                     const SizedBox(width: 16),

//                     // Retweets/Shares
//                     Row(
//                       children: [
//                         const Icon(Icons.repeat, size: 18, color: Colors.grey),
//                         const SizedBox(width: 4),
//                         Text(
//                           shares.toString(),
//                           style: const TextStyle(
//                             color: Colors.grey,
//                             fontSize: 14,
//                           ),
//                         ),
//                       ],
//                     ),

//                     const SizedBox(width: 16),

//                     // Share button
//                     const Icon(Icons.send, size: 18, color: Colors.grey),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
