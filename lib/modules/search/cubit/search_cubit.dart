import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kulture/modules/search/cubit/search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchState.initial());

  void onSearchQueryChanged(String query) {
    emit(state.copyWith(
      searchQuery: query,
      isSearching: query.isNotEmpty,
    ));
    // TODO: Implement actual search functionality
    // This would typically involve calling an API or searching local data
  }

  void clearSearch() {
    emit(state.copyWith(
      searchQuery: '',
      isSearching: false,
    ));
  }

  void toggleFollowStatus(String userId) {
    // In a real app, this would make an API call to follow/unfollow
    final updatedUsers = state.suggestedUsers.map((user) {
      if (user['id'] == userId) {
        return {
          ...user,
          'isFollowing': !(user['isFollowing'] as bool),
        };
      }
      return user;
    }).toList();

    emit(state.copyWith(suggestedUsers: updatedUsers));
  }
}
