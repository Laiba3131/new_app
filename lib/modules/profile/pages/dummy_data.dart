import 'package:kulture/generated/assets.dart';
import 'package:kulture/modules/profile/model/comment_model.dart';
import 'package:kulture/modules/profile/model/post_data_model.dart';
import 'package:kulture/modules/profile/model/suggested_user_model.dart';

class DummyData {
  static final List<Map<String, String>> friends = [
    {
      'name': 'Ashley Baker',
      'username': 'Ashley The Name',
      'avatarUrl': Assets.pngImage3,
    },
    {
      'name': 'BeeQueen',
      'username': 'Official queen bee',
      'avatarUrl': Assets.pngImage7,
    },
    {
      'name': 'CindyPat',
      'username': 'My name Cindy',
      'avatarUrl': Assets.pngImage4,
    },
  ];

  static final List<Map<String, String>> suggestedFriends = [
    {
      'name': 'Lovelyc.',
      'username': 'Lovely to c you',
      'avatarUrl': Assets.img1,
    },
    {
      'name': 'Heavenl.',
      'username': 'Made from heaven',
      'avatarUrl': Assets.pngImage3,
    },
  ];

  static final List<PostData> posts = [
    PostData(
      username: "tinybosshq",
      timeAgo: "33m",
      content:
          "Dressing up isn't just about clothes; it's about confidence. Let's talk outfits that make us feel unstoppable! 💓",
      hashtags: ["StyleQueen"],
      likes: 587,
      comments: 20,
      retweets: 5,
    ),
    PostData(
      username: "tinybosshq",
      timeAgo: "13m",
      content:
          "Fashion is my love language! Let's dive into the trends that make our hearts skip a beat. I think i can really be a model one day. 💓",
      hashtags: ["ChicAndConfident"],
      likes: 600,
      comments: 54,
      retweets: 7,
    ),
    // PostData(
    //   username: "tinybosshq",
    //   timeAgo: "13m",
    //   content:
    //       "Fashion is my love language! Let's dive into the trends that make our hearts skip a beat. I think i can really be a model one day. 💓",
    //   hashtags: ["ChicAndConfident"],
    //   likes: 587,
    //   comments: 20,
    //   retweets: 0,
    // ),
  ];
  static final List<Map<String, dynamic>> blockedUsers = [
    {
      'name': 'Queenbee',
      'username': 'Queen of the bees',
      'bio': 'Chasing dreams ✨ | Coffee lover ☕',
      'followers': '1.5k followers',
      'imageUrl': Assets.pngImage1,
    },
    {
      'name': 'Ashleybacker',
      'username': 'Ashley Thorne',
      'bio':
          '🔥Just a girl with big plans 🔥\n🌎Living life one adventure at a time',
      'followers': '5.6k followers',
      'imageUrl': Assets.pngImage2,
    },
    {
      'name': 'BeeQueen',
      'username': 'Official queen bee',
      'bio':
          'Fashion & coffee obsessed 👗☕\nEmpowering women\nHere to make a difference 💪',
      'followers': '1.0k followers',
      'imageUrl': Assets.pngImage3,
    },
    {
      'name': 'CindyPat',
      'username': 'Cindy sandy',
      'bio':
          'Living life in full color 🌈\nDreaming big 💫\nDancing through life 💃',
      'followers': '3.5k followers',
      'imageUrl': Assets.pngImage4,
    },
    {
      'name': 'BeeQueen',
      'username': 'Official queen bee',
      'bio':
          'Fashion & coffee obsessed 👗☕\nEmpowering women\nHere to make a difference 💪',
      'followers': '1.0k followers',
      'imageUrl': Assets.pngImage3,
    },
    {
      'name': 'CindyPat',
      'username': 'Cindy sandy',
      'bio':
          'Living life in full color 🌈\nDreaming big 💫\nDancing through life 💃',
      'followers': '3.5k followers',
      'imageUrl': Assets.pngImage4,
    },
    {
      'name': 'BeeQueen',
      'username': 'Official queen bee',
      'bio':
          'Fashion & coffee obsessed 👗☕\nEmpowering women\nHere to make a difference 💪',
      'followers': '1.0k followers',
      'imageUrl': Assets.pngImage3,
    },
    {
      'name': 'CindyPat',
      'username': 'Cindy sandy',
      'bio':
          'Living life in full color 🌈\nDreaming big 💫\nDancing through life 💃',
      'followers': '3.5k followers',
      'imageUrl': Assets.pngImage4,
    },
  ];

  static final List<SuggestedUser> users = [
    SuggestedUser(
      name: 'Heidi & Tara',
      username: 'snipestwins',
      imageUrl: Assets.pngImage1,
    ),
    SuggestedUser(
      name: 'Heidi & Tara',
      username: 'snipestwins',
      imageUrl: Assets.pngImage2,
    ),
    SuggestedUser(
      name: 'Heidi & Tara',
      username: 'snipestwins',
      imageUrl: Assets.pngImage3,
    ),
  ];

  static final List<Comment> comments = [
    Comment(
      username: 'Monica Avila',
      text: 'This right her is very cute and i love it girl 😍 ',
      timeAgo: '2h',
      userImage: Assets.pngImage1,
      likes: 24,
      replies: [
        Comment(
          username: 'Tierra Tierra',
          text: 'Monica Avila Me too!! I reall love it ',
          timeAgo: '1h',
          userImage: Assets.pngImage1,
          likes: 5,
          replies: [
            Comment(
              username: 'Tierra Tierra',
              text: 'Monica Avila Me too!! I reall love it ',
              timeAgo: '1h',
              userImage: Assets.pngImage1,
              likes: 5,
            ),
          ]
        ),
        Comment(
          username: 'jane_smith',
          text: 'Totally agree!',
          timeAgo: '1h',
          userImage: Assets.pngImage1,
          likes: 5,
        ),
      ],
    ),
    Comment(
      username: 'sarah.designs',
      text: 'Love your content! Keep it up 👏',
      timeAgo: '5h',
      userImage: Assets.pngImage1,
      likes: 42,
    ),
  ];
}
