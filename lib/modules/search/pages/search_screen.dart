import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kulture/constants/app_colors.dart';
import 'package:kulture/modules/search/cubit/search_cubit.dart';
import 'package:kulture/modules/search/cubit/search_state.dart';
import 'package:kulture/modules/search/widgets/follow_tile_widget.dart';
import 'package:kulture/ui/input/input_field.dart';
import 'package:kulture/utils/extensions/extended_context.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _searchFocusNode = FocusNode();

  @override
  void dispose() {
    _searchController.dispose();
    _searchFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchCubit(),
      child: BlocBuilder<SearchCubit, SearchState>(
        builder: (context, state) {
          return GestureDetector(
            onTap: () {
              // Unfocus the search field when tapping outside
              _searchFocusNode.unfocus();
            },
            child: Scaffold(
              backgroundColor: AppColors.white,
              body: SafeArea(
                bottom: false,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        'Search',
                        style: context.textTheme.bodyMedium?.copyWith(
                            color: AppColors.black,
                            fontSize: 32,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: InputField(
                              fillColor: AppColors.searchBarColor,
                              controller: _searchController,
                              label: "Search",
                              boxConstraints: 60.0,
                              hintColor: AppColors.textGrey,
                              borderRadius: 16.0,
                              textColor: AppColors.textGrey,
                              prefixIcon: const Icon(
                                Icons.search,
                                color: AppColors.textGrey,
                              ),
                              suffixIcon: state.isSearching
                                  ? IconButton(
                                      icon: const Icon(Icons.clear),
                                      onPressed: () {
                                        _searchController.clear();
                                        context
                                            .read<SearchCubit>()
                                            .clearSearch();
                                      },
                                    )
                                  : null,
                              onChange: (value) {
                                context
                                    .read<SearchCubit>()
                                    .onSearchQueryChanged(value);
                              },
                              focusNode: _searchFocusNode,
                            ),
                          ),
                          if (_searchFocusNode.hasFocus)
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: TextButton(
                                onPressed: () {
                                  _searchController.clear();
                                  context.read<SearchCubit>().clearSearch();
                                  _searchFocusNode.unfocus();
                                },
                                child: const Text('Cancel'),
                              ),
                            ),
                        ],
                      ),
                    ),
                    if (!state.isSearching && !_searchFocusNode.hasFocus) ...[
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          'Follow suggestions',
                          style: context.textTheme.titleMedium?.copyWith(
                              color: AppColors.textGrey,
                              fontSize: 14,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                      Expanded(
                        child: ListView.separated(
                          itemCount: state.suggestedUsers.length,
                          separatorBuilder: (context, index) => const Padding(
                            padding: EdgeInsets.only(left: 75.0),
                            child: Divider(
                              height: 1,
                              thickness: 0.5,
                              color: AppColors.lightGreyColor,
                            ),
                          ),
                          itemBuilder: (context, index) {
                            final user = state.suggestedUsers[index];
                            return UserProfileTile(user: user);
                          },
                        ),
                      ),
                    ] else if (_searchFocusNode.hasFocus) ...[
                      Expanded(
                        child: Column(
                          children: [
                            const Expanded(
                              child: Center(
                                child: Text('Start typing to search...'),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(8.0),
                              color: Colors.grey[200],
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  TextButton(
                                    onPressed: () {
                                      _searchFocusNode.unfocus();
                                    },
                                    child: const Text('Done'),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ] else ...[
                      const Expanded(
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
