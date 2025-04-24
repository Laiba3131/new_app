import 'package:equatable/equatable.dart';
import 'package:kulture/generated/assets.dart';

class SearchState extends Equatable {
  final String searchQuery;
  final bool isSearching;
  final List<Map<String, dynamic>> suggestedUsers;

  const SearchState({
    required this.searchQuery,
    required this.isSearching,
    required this.suggestedUsers,
  });

  factory SearchState.initial() {
    return const SearchState(
      searchQuery: '',
      isSearching: false,
      suggestedUsers: [
        {
          'id': '1',
          'name': 'Queenbee',
          'username': 'Queen of the bees',
          'bio': 'Chasing dreams ✨ | Coffee lover ☕',
          'followers': '1.5k followers',
          'imageUrl': Assets.pngImage4,
          'isFollowing': false,
        },
        {
          'id': '2',
          'name': 'Ashleybacker',
          'username': 'Ashley The Name',
          'bio':
              '🔥Just a girl with big plans 🔥\n🌎Living life one adventure at a time',
          'followers': '5.6k followers',
          'imageUrl': Assets.pngImage3,
          'isFollowing': true,
        },
        {
          'id': '3',
          'name': 'BeeQueen',
          'username': 'Official queen bee',
          'bio':
              'Fashion & coffee obsessed 👗☕\nEmpowering women\nHere to make a difference 💪',
          'followers': '1.0k followers',
          'imageUrl': Assets.pngImage2,
          'isFollowing': false,
        },
        {
          'id': '4',
          'name': 'CindyPat',
          'username': 'Cindy sandy',
          'bio':
              'Living life in full color 🌈\nDreaming big 💫\nDancing through life 💃',
          'followers': '3.5k followers',
          'imageUrl': Assets.pngImage1,
          'isFollowing': true,
        },
        {
          'id': '5',
          'name': 'CindyPat',
          'username': 'Cindy sandy',
          'bio':
              'Living life in full color 🌈\nDreaming big 💫\nDancing through life 💃',
          'followers': '3.5k followers',
          'imageUrl': Assets.pngImage1,
          'isFollowing': true,
        },
        {
          'id': '6',
          'name': 'CindyPat',
          'username': 'Cindy sandy',
          'bio':
              'Living life in full color 🌈\nDreaming big 💫\nDancing through life 💃',
          'followers': '3.5k followers',
          'imageUrl': Assets.pngImage1,
          'isFollowing': true,
        },
        {
          'id': '7',
          'name': 'CindyPat',
          'username': 'Cindy sandy',
          'bio':
              'Living life in full color 🌈\nDreaming big 💫\nDancing through life 💃',
          'followers': '3.5k followers',
          'imageUrl': Assets.pngImage1,
          'isFollowing': true,
        },
      ],
    );
  }

  SearchState copyWith({
    String? searchQuery,
    bool? isSearching,
    List<Map<String, dynamic>>? suggestedUsers,
  }) {
    return SearchState(
      searchQuery: searchQuery ?? this.searchQuery,
      isSearching: isSearching ?? this.isSearching,
      suggestedUsers: suggestedUsers ?? this.suggestedUsers,
    );
  }

  @override
  List<Object?> get props => [searchQuery, isSearching, suggestedUsers];
}
